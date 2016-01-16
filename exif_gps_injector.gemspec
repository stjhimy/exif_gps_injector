Gem::Specification.new do |s|
  s.name        = 'exif_gps_injector'
  s.authors     = ['Jhimy Fernandes Villar']
  s.email       = ['stjhimy@gmail.com']
  s.homepage    = 'http://github.com/stjhimy/exif_gps_injector'
  s.license     = 'MIT'
  s.summary     = 'Add GPS exif tags to media files'
  s.description = 'Add GPS exif tags to images/videos based on a kml file'
  s.version     = '1.0.0'

  s.executables   = ['exif_gps_injector']
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency 'activesupport',               '~> 4.2'
  s.add_dependency 'mini_exiftool',               '~> 2.5'
  s.add_dependency 'nokogiri',                    '~> 1.6'
  s.add_dependency 'ruby-progressbar',            '~> 1.7'

  s.add_development_dependency 'guard',           '~> 2.13'
  s.add_development_dependency 'guard-rspec',     '~> 4.6'
  s.add_development_dependency 'guard-rubocop',   '~> 1.2'
  s.add_development_dependency 'rspec',           '~> 3.4'
end
