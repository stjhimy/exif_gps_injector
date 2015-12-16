# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'exif_gps_injector/version'

Gem::Specification.new do |s|
  s.name        = 'exif_gps_injector'
  s.version     = ExifGpsInjector::VERSION
  s.authors     = ['Jhimy Fernandes Villar']
  s.email       = ['stjhimy@gmail.com']
  s.homepage    = 'http://github.com/stjhimy/exif_gps_injector'
  s.summary     = ''
  s.description = ""
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec',   '~> 3.4'
  s.add_dependency 'nokogiri',            '~> 1.6'
end
