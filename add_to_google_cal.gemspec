# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'add_to_google_cal/version'

Gem::Specification.new do |spec|
  spec.name          = "add_to_google_cal"
  spec.version       = AddToGoogleCal::VERSION
  spec.authors       = ["Charles Bergeron"]
  spec.email         = ["hello@charlesbergeron.ca"]
  spec.description   = %q{A view layer helper which takes an object (such as an ActiveRecord instance from your database) and generates an "Add To Google Calendar" URL based on it's attributes.}
  spec.summary       = %q{Google Calendar anchor href link url helper presenter.}
  spec.homepage      = "https://github.com/chuckbergeron/add_to_google_cal"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord', '>= 3.0'
  spec.add_development_dependency 'bundler', '>= 1.3'
  # spec.add_development_dependency 'pry-debugger'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 2.0'
  spec.add_development_dependency 'sqlite3'
end

