# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'subspp/version'

Gem::Specification.new do |spec|
  spec.name          = "subspp"
  spec.version       = Subspp::VERSION
  spec.authors       = ["Tristan Peralta"]
  spec.email         = ["tristanperalta@gmail.com"]
  spec.summary       = %q{ Ruby client for subs.pinpayments.com API }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
end
