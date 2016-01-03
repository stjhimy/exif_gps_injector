require 'spec_helper'

describe ExifGpsInjector::Media do
  before(:all) do
    system("cp #{File.join(File.dirname(__FILE__), '../fixtures/_example.jpg')} #{File.join(File.dirname(__FILE__), '../fixtures/example.jpg')}")
  end

  after(:all) do
    system("rm #{File.join(File.dirname(__FILE__), '../fixtures/example.jpg')}")
  end

  let(:media) do
    ExifGpsInjector::Media.new(File.join(File.dirname(__FILE__), '../fixtures/example.jpg'))
  end

  it 'return tags' do
    expect(media.tags).to_not eq(nil)
    expect(media.tags).to_not eq({})
    expect(media.tags.count).to be > 0
    expect(media.tags['FileSize']).to include('bytes')
  end

  it 'return original_date_time' do
    expect(media.original_date_time).to eq('2015-01-01 00:00:00.000000000 -0200')
  end

  it 'set original_date_time' do
    media.original_date_time = '2015-02-01'
    expect(media.tags['DateTimeOriginal']).to eq('2015-02-01 00:00:00 -0200')
  end
end
