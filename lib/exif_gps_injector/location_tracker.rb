module ExifGpsInjector
  class LocationTracker
    def initialize(file)
      @list = Nokogiri::XML(File.open(file)).search("when").map{|node| {(DateTime.parse(node.text).utc - 2.hours) => node.next_element.text}}.reduce({}, :merge).sort.to_h
    end
  end
end
