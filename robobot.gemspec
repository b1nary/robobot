# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robobot/version'

Gem::Specification.new do |gem|
  gem.name          = "robobot"
  gem.version       = Robobot::VERSION
  gem.authors       = ["Roman Pramberger"]
  gem.email         = ["roman@pramberger.ch"]
  gem.description   = %q{Automate tasks with mouse and keyboard inputs.}
  gem.summary       = %q{Automate tasks with mouse and keyboard inputs.}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.add_runtime_dependency 'rmagick', ">= 2.0.0"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
