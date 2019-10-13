# frozen_string_literal: true

require File.expand_path("../lib/dialectica/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "dialectica"
  spec.version = Dialectica::VERSION
  spec.summary = "Dialectica"
  spec.description = "A New Information Architecture"

  spec.authors = ["Bryan Powell", "Rico Picone"]
  spec.email = "bryan@bryanp.org"
  spec.homepage = "https://dialectica.io"

  spec.required_ruby_version = ">= 2.5.0"

  spec.license = "LGPL-3.0"

  spec.files = Dir["CHANGELOG.md", "README.md", "LICENSE", "lib/**/*"]
  spec.require_path = "lib"
end
