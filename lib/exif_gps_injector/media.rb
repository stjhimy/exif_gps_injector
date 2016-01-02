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
  end
end
