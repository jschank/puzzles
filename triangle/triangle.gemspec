# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'triangle/version'

Gem::Specification.new do |spec|
  spec.name          = "triangle"
  spec.version       = Triangle::VERSION
  spec.authors       = ["John F Schank III"]
  spec.email         = ["jschank@mac.com"]
  spec.summary       = %q{Standard puzzle program}
  spec.description   = %q{Written for Workbridge Associates, as an example of puzzles from Gannett interviews}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rake'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'guard-minitest'
  

  # spec.add_development_dependency 'autotest-standalone'
  # spec.add_development_dependency 'autotest-fsevent'
  # spec.add_development_dependency 'autotest-growl'
  # spec.add_development_dependency 'autotest-suffix'
  
end
