# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neptune_apex/version'

Gem::Specification.new do |spec|
  spec.name          = "neptune_apex"
  spec.version       = NeptuneApex::VERSION
  spec.authors       = ["Scott Peshak"]
  spec.email         = ["scott@peshak.net"]
  spec.summary       = %q{Gem for interacting with a Neptune Apex aquarium controller.}
  spec.homepage      = "https://github.com/speshak/apex"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.executables << "apex"

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "terminal-table", "~> 1.5"
  spec.add_dependency "httpclient", "~> 2.7"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
end
