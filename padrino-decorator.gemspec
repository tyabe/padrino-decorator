#!/usr/bin/env gem build
# encoding: utf-8

require File.expand_path('../lib/padrino-decorator/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = "padrino-decorator"
  s.rubyforge_project = "padrino-decorator"
  s.authors       = ["Takeshi Yabe"]
  s.email         = ["tyabe@nilidea.com"]
  s.summary       = "View models for padrino"
  s.homepage      = "https://github.com/tyabe/padrino-decorator#readme"
  s.description   = "Object-Oriented layer of presentation logic to your Padrino apps."
  s.required_rubygems_version = ">= 1.3.6"
  s.version       = Padrino::Decorator.version
  s.date          = Time.now.strftime("%Y-%m-%d")

  s.extra_rdoc_files = Dir["*.rdoc"]
  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.rdoc_options  = ["--charset=UTF-8"]

  s.add_dependency "padrino-gen", "~> 0.11.0"
  s.add_dependency "padrino-helpers", "~> 0.11.0"

  s.add_development_dependency "padrino-core", "~> 0.11.0"
end
