require 'rubygems'
require 'bundler/setup'

require 'exif_gps_injector'

VCR.configure do |config|
end

RSpec.configure(&:raise_errors_for_deprecations!)