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
  end
end
