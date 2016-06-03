# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stuff-classifier/version"

Gem::Specification.new do |s|
  s.name        = "stuff-classifier"
  s.version     = StuffClassifier::VERSION
  s.authors     = ["Alexandru Nedelcu"]
  s.email       = ["github@contact.bionicspirit.com"]
  s.homepage    = "https://github.com/alexandru/stuff-classifier/"
  s.summary     = %q{Simple text classifier(s) implemetation}
  s.description = %q{2 methods are provided for now - (1) naive bayes implementation + (2) tf-idf weights}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 2.3.1' # works with older 1.9.1+ but you should update your ruby!
  
  s.add_runtime_dependency "ruby-stemmer"
  s.add_runtime_dependency "sequel"
  s.add_runtime_dependency "redis"


  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "turn"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "awesome_print"


end

