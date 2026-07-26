# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "steuernummer/version"

Gem::Specification.new do |spec|
  spec.name = "steuernummer"
  spec.version = Steuernummer::VERSION
  spec.authors = ["Bart Ariens"]
  spec.email = ["steuernummer@ibariens.nl"]
  spec.description = %q{Validates with regex the German Steuernummer and allows to return the region (Bundesland) and/or unified region number (Vereinheitlictes Bundesschema)}
  spec.summary = %q{Simple regex validator for German Steuernummer}
  spec.homepage = "https://github.com/ibariens/steuernummer"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "test-unit", "~> 3.0"

  spec.metadata = {
    "source_code_uri" => "https://github.com/ibariens/steuernummer",
    "changelog_uri" => "https://github.com/ibariens/steuernummer/releases",
  }
end
