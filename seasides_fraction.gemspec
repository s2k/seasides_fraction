
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seasides_fraction/version'

Gem::Specification.new do |spec|
  spec.name          = 'seasides_fraction'
  spec.version       = SeasidesFraction::VERSION
  spec.authors       = ['Stephan Kämper']
  spec.email         = ['the.tester@seasidetesting.com']

  spec.summary       = "A class to represent rational numbers. It is an exercise. Don't use this. Use the one that comes with Ruby instead."
  spec.description   = "A hand crafted class for rational numbers, a result the the first exercise of J. B. Rainsberger's onlne course 'The World's Best Intro to TDD'"
  spec.homepage      = 'https://github.com/s2k/seasides_fraction'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'guard-bundler', '~> 3.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rb-fsevent', '~> 0.10'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'terminal-notifier', '~> 2.0'
  spec.add_development_dependency 'terminal-notifier-guard', '~> 1.7'
end
