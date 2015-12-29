module ExifGpsInjector
  # LocationTracker
  class LocationTracker
    attr_reader :list

    def initialize(file)
      @list = Nokogiri::XML(File.open(file)).search('when')
              .map { |e| { (Time.parse(e.text).utc - 2.hours) => e.next_element.text } }
              .reduce({}, :merge)
              .sort.to_h
    end

    def locate_at(date)
      @list.select { |key, _value| key <= date && key >= date - 3.minutes }.to_a.last.last ||
        @list.select { |key, _value| key >= date && key <= date + 3.minutes }.to_a.first.last
    end
  end
end
