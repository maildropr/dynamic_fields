# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamic_fields/version'

Gem::Specification.new do |spec|
  spec.name          = "dynamic_fields"
  spec.version       = DynamicFields::VERSION
  spec.authors       = ["MailDropr"]
  spec.email         = ["contact@maildropr.com"]
  spec.description   = "Define custom fields"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/maildropr/dynamic_fields"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"

end
