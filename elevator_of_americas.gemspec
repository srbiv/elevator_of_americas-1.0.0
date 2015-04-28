# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elevator_of_americas/version'

Gem::Specification.new do |spec|
  spec.name          = "elevator_of_americas"
  spec.version       = ElevatorOfAmericas::VERSION
  spec.authors       = ["Robert Ross"]
  spec.email         = ["rross@digitalocean.com"]
  spec.summary       = %q{Elevator Code Fun}
  spec.description   = %q{It is fun to code elevators}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib/elevator_of_americas"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
