module ExifGpsInjector
  # LocationTracker
  class LocationTracker
    def initialize(file)
      @list = Nokogiri::XML(File.open(file)).search('when')
              .map { |e| { (DateTime.parse(e.text).utc - 2.hours) => e.next_element.text } }
              .reduce({}, :merge)
              .sort.to_h
    end
  end
end
