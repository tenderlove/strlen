# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = "strlen"
  s.version     = "1.0.0"
  s.summary     = "A Ruby wrapper for strlen"
  s.description = "This is a Ruby wrapper for strlen, you should not use it"
  s.authors     = ["Aaron Patterson"]
  s.email       = "tenderlove@ruby-lang.org"
  s.files       = `git ls-files -z`.split("\x0")
  s.test_files  = s.files.grep(%r{^test/})
  s.homepage    = "https://github.com/tenderlove/strlen"
  s.license     = "Apache-2.0"
  s.require_paths = ["lib"]
  s.extensions = ["ext/strlen/extconf.rb"]

  s.add_development_dependency("rake", "~> 13.0")
  s.add_development_dependency("minitest", "~> 5.14")
end
