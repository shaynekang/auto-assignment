# -*- encoding: utf-8 -*-
require File.expand_path('../lib/auto_assignment', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["paranoiase Kang"]
  gem.email         = ["paranoiase@gmail.com"]
  gem.description   = "Auto assign model resource and collection from controller"
  gem.summary       = %q{Auto assignment of ruby on rails}
  gem.homepage      = "https://github.com/paranoiase/auto-assignment"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = "auto-assignment"
  gem.require_paths = ["lib"]
  gem.version       = AutoAssignment::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rspec-rails', '~> 2.7'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'activesupport', '~> 3.2'
end
