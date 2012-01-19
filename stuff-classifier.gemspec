# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stuff-classifier/version"

Gem::Specification.new do |s|
  s.name        = "stuff-classifier"
  s.version     = StuffClassifier::VERSION
  s.authors     = ["Alexandru Nedelcu"]
  s.email       = ["me@alexn.org"]
  s.homepage    = "https://github.com/alexandru/stuff-classifier/"
  s.summary     = %q{Classifies stuff}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", ">= 0.9.2"
  s.add_development_dependency "minitest", ">= 2.10"
  s.add_development_dependency "turn", ">= 0.8.3"
  s.add_development_dependency "rdoc", ">= 3.1"
  s.add_development_dependency "rcov", ">= 0.9"
end

