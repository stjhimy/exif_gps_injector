require 'spec_helper'

describe ExifGpsInjector::Media do
  let(:media) do
    ExifGpsInjector::Media.new(File.join(File.dirname(__FILE__), '../fixtures/ruby.jpg'))
  end

  it 'return tags' do
    expect(media.tags).to_not eq(nil)
    expect(media.tags.count).to be > 0
  end
end
