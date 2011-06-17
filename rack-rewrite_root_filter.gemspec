# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rack/rewrite_root_filter/version"

Gem::Specification.new do |s|
  s.name        = "rack-rewrite_root_filter"
  s.version     = Rack::RewriteRootFilter::VERSION
  s.authors     = ["Micah Geisel"]
  s.email       = ["micah@botandrose.com"]
  s.homepage    = "http://github.com/botandrose/rack-rewrite_root_filter"
  s.summary     = %q{Rack middleware to rewrite the links on both the request and the response.}
  s.description = %q{Rack middleware to rewrite the links on both the request and the response.}

  s.rubyforge_project = "rack-rewrite_root_filter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
