module ExifGpsInjector
  # Media
  class Media
    attr_reader :exif

    def initialize(file)
      @exif = MiniExiftool.new(file)
    end

    def tags
      @exif.tags
    end
  end
end
