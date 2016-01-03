require 'pp'
module ExifGpsInjector
  # Media
  class Media
    attr_reader :exif

    def initialize(file)
      @exif = MiniExiftool.new(file)
    end

    def tags
      @exif.tags.map { |e| [e, @exif[e]] }.to_h
    end

    def original_date_time
      @original_date_time ||= @exif.date_time_original || @exif.file_create_date || @exif.file_modify_date
    end

    def original_date_time=(value)
      date = DateTime.parse(value).strftime
      @exif.date_time_original = date
      @exif.create = date
      @exif.modify_date = date
      @exif.save
      value
    end

    def location
      { latitude: @exif.gps_latitude, longitude: @exif.gps_longitude }
    end
  end
end
