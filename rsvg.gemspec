# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rsvg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jonathan Lozinski"]
  gem.email         = ["jonathan.lozinski@sage.com"]
  gem.description   = %q{Ruby SVG Library§}
  gem.summary       = %q{Extendable ruby svg builder}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rsvg"
  gem.require_paths = ["lib"]
  gem.version       = Rsvg::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
end
