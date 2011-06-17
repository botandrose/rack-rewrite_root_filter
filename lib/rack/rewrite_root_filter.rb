require "rack/rewrite_root_filter/version"

module Rack
  class RewriteRootFilter
    def initialize app, from, to
      @app = app
      @from = from
      @to = to
    end

    def call env
      env = rewrite_request env
      status, headers, body = @app.call env

      body = rewrite_body body
      [status, headers, body]
    end

    private

    def rewrite_request env
      interpreted_to = env['REQUEST_URI'].sub /^#{@to}/, @from
      env['REQUEST_URI'] = interpreted_to
      if q_index = interpreted_to.index('?')
        env['PATH_INFO'] = interpreted_to[0..q_index-1]
        env['QUERY_STRING'] = interpreted_to[q_index+1..interpreted_to.size-1]
      else
        env['PATH_INFO'] = interpreted_to
        env['QUERY_STRING'] = ''
      end
      env
    end

    def rewrite_body body
      new_body = ""
      body.each { |part| new_body << part }
      new_body.gsub! /(["'])#{@from}/, "\\1#{@to}"
      [new_body]
    end
  end
end
