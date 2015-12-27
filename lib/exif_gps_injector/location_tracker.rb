module ExifGpsInjector
  # LocationTracker
  class LocationTracker
    def initialize(file)
      @list = Nokogiri::XML(File.open(file)).search('when')
              .map { |e| { (DateTime.parse(e.text).utc - 2.hours) => e.next_element.text } }
              .reduce({}, :merge)
              .sort.to_h
    end
    def list
      @list
    end

    def self.instance
    end

    def self.locate_at(date)
      instance.list.select{|key, value| key <= date && key >= date - 3.minutes }.to_a.last.last rescue nil ||
        instance.list.select{|key, value| key >= date && key <= date + 3.minutes }.to_a.first.last rescue nil
    end
  end
end
