# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'international_trade/version'

Gem::Specification.new do |spec|
  spec.name          = 'international_trade'
  spec.version       = InternationalTrade::VERSION
  spec.authors       = ['John F Schank III']
  spec.email         = ['jschank@mac.com']
  spec.summary       = 'Puzzle Node - International Trade'
  spec.description   = 'What is the grand total of sales for item DM1182 across all stores in USD currency?'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency 'nori'
  spec.add_development_dependency 'recursive-open-struct'
  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'PriorityQueue'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
end
