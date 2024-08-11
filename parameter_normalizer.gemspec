# frozen_string_literal: true

require_relative "lib/parameter_normalizer/version"

Gem::Specification.new do |spec|
  spec.name = "parameter_normalizer"
  spec.version = ParameterNormalizer::VERSION
  spec.authors = ["Takahiro Ooishi"]
  spec.email = ["taka0125@gmail.com"]

  spec.summary = "A utility gem for normalizing parameters in Rails applications."
  spec.description = "A utility gem for normalizing parameters in Rails applications."
  spec.homepage = "https://github.com/taka0125/parameter_normalizer"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir['lib/**/*', 'exe/**/*', 'sig/**/*']
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'appraisal'
end
