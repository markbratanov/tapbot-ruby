# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tapbot/version'

Gem::Specification.new do |spec|
  spec.name          = "tapbot"
  spec.version       = Tapbot::VERSION
  spec.authors       = ["David Ramirez"]
  spec.email         = ["david@davidrv.com"]

  spec.summary       = "Tapbot api gem"
  spec.description   = "Tapbot api gem"
  spec.homepage      = "https://tapbot.readme.io/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["README.md","Gemfile","Rakefile", "spec/*", "lib/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'webmock', '~> 1.6'
  spec.add_development_dependency "rspec"
  
  spec.add_runtime_dependency 'httparty', '~> 0.13.7'
  spec.add_runtime_dependency 'hashie', '~> 3.4', '>= 3.4.2'
end
