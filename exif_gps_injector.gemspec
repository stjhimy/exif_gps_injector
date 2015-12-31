Gem::Specification.new do |s|
  s.name        = 'exif_gps_injector'
  s.version     = '0.0.1'
  s.authors     = ['Jhimy Fernandes Villar']
  s.email       = ['stjhimy@gmail.com']
  s.homepage    = 'http://github.com/stjhimy/exif_gps_injector'
  s.summary     = ''
  s.description = ''
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'guard',           '~> 2.13'
  s.add_development_dependency 'guard-rspec',     '~> 4.6'
  s.add_development_dependency 'guard-rubocop',   '~> 1.2'
  s.add_development_dependency 'rspec',           '~> 3.4'
  s.add_development_dependency 'vcr',             '~> 3.0'
  s.add_dependency 'mini_exiftool',               '~> 2.5'
  s.add_dependency 'nokogiri',                    '~> 1.6'
  s.add_dependency 'activesupport',               '~> 4.2'
end
