# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esri_shapefile/version'

Gem::Specification.new do |spec|
  spec.name          = "esri_shapefile"
  spec.version       = EsriShapefile::VERSION
  spec.authors       = ["Joe Karayusuf"]
  spec.email         = ["jkarayusuf@gmail.com"]
  spec.summary       = %q{Library to read and write ESRI Shapefiles}
  spec.description   = %q{Library to read and write ESRI Shapefiles}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry"
end
