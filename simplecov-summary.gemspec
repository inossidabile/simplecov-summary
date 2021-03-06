# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecov-summary/version'

Gem::Specification.new do |gem|
  gem.name          = "simplecov-summary"
  gem.version       = Simplecov::Summary::VERSION
  gem.authors       = ["Boris Staal"]
  gem.email         = ["boris@roundlake.ru"]
  gem.description   = %q{SimpleCov formatter that prints nice colored summary for your coverage straight into your console.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/inossidabile/simplecov-summary"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'simplecov'
  gem.add_dependency 'colorize'
end
