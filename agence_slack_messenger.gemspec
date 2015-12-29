# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'agence_slack_messenger/version'

Gem::Specification.new do |spec|
  spec.name          = "agence_slack_messenger"
  spec.version       = AgenceSlackMessenger::VERSION
  spec.authors       = ["Rodrigo Toledo"]
  spec.email         = ["rodrigo@rtoledo.inf.br"]

  spec.summary       = %q{Interacao entre o slack e projetos da agence}
  spec.description   = %q{Interacao entre o slack e projetos da agence}

  spec.files         = Dir["README.md", "lib/**/*", "config/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "curb"
end
