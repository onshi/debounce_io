# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'debounce_io/version'

Gem::Specification.new do |spec|
  spec.name          = 'debounce_io'
  spec.version       = DebounceIo::VERSION
  spec.authors       = ['Jan Makara']
  spec.email         = ['jan.makara@hotmail.com']

  spec.summary       = %q{Ruby wrapper for debounce.io API}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/onshi/debounce_io'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print', '>= 1.8'
  spec.add_development_dependency 'bundler', '>= 2.0'
  spec.add_development_dependency 'pry', '>= 0.12'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'rubocop', '>= 0.66'
  spec.add_development_dependency 'vcr', '>= 4.0'
  spec.add_development_dependency 'webmock', '>= 3.0'

  spec.required_ruby_version = '>= 2.6'
end
