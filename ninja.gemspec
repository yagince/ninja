# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ninja/version'

Gem::Specification.new do |spec|
  spec.name          = "ninja"
  spec.version       = Ninja::VERSION
  spec.authors       = ["yagince"]
  spec.email         = ["straitwalk@gmail.com"]
  spec.description   = %q{the library behind the scenes}
  spec.summary       = %q{behind the scenes}
  spec.homepage      = "https://github.com/yagince/ninja"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rb-fsevent"
  spec.add_development_dependency "guard-rspec"

end
