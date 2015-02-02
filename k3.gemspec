# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'k3/version'

Gem::Specification.new do |spec|
  spec.name          = "k3"
  spec.version       = K3::VERSION
  spec.authors       = ["TheMadDeveloper"]
  spec.email         = ["w@keithkerlan.com"]
  spec.description   = %q{For manage k3 library javascript plugins/widgets}
  spec.summary       = %q{For manage k3 library javascript plugins/widgets}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
