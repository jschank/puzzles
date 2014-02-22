# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moveit/version'

Gem::Specification.new do |spec|
  spec.name          = "moveit"
  spec.version       = Moveit::VERSION
  spec.authors       = ["John F Schank III"]
  spec.email         = ["jschank@mac.com"]
  spec.summary       = %q{Validate chess moves}
  spec.description   = %q{Programming puzzle for Arlington Ruby Meetup}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'guard-rake'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'guard-minitest'
end
