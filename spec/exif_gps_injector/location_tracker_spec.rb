require 'spec_helper'

describe ExifGpsInjector::LocationTracker do
  it 'parse a list of locations based on kml file' do
    file = File.join(File.dirname(__FILE__), '../fixtures/history.kml')
    tracker = ExifGpsInjector::LocationTracker.new(file)
    expect(tracker.list).to_not be_nil
    expect(tracker.list).to_not eq({})
  end
end
