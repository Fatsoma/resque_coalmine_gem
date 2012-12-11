# -*- encoding: utf-8 -*-
require File.expand_path('../lib/resque_coalmine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Luqman Amjad"]
  gem.email         = ["luqman.amjad@fatsoma.com"]
  gem.description   = 'Sends exceptions to coalmineapp.com'
  gem.summary       = 'Resque failure backend for coalmine'
  gem.homepage      = "http://www.fatsoma.com"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "resque_coalmine"
  gem.require_paths = ["lib"]
  gem.version       = ResqueCoalmine::VERSION

  gem.add_dependency('coalmine', '0.5.3')
  gem.add_dependency('resque', '1.23.0')
end
