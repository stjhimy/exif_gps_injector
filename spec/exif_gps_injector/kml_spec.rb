require 'spec_helper'

describe ExifGpsInjector::Kml do
  let(:kml) { File.join(File.dirname(__FILE__), '../fixtures/history.kml') }

  it 'parse a list of locations based on kml file' do
    tracker = ExifGpsInjector::Kml.new(kml)
    expect(tracker.list).to_not be_nil
    expect(tracker.list).to_not eq({})
  end

  describe 'locate_at' do
    it 'return gps coordinates' do
      tracker = ExifGpsInjector::Kml.new(kml)
      expect(tracker.locate_at('2015-12-27T02:00:35+00:00')).to eq('-48.000 -21.000 0')
    end

    it 'return nil when no match is found' do
      tracker = ExifGpsInjector::Kml.new(kml)
      expect(tracker.locate_at('2015-01-01')).to eq(nil)
    end
  end
end
