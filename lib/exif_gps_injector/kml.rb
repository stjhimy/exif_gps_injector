module ExifGpsInjector
  # Kml
  class Kml
    attr_reader :list
    attr_accessor :max_distance_time

    def initialize(file, options = {})
      @max_distance_time = options.delete(:max_distance_time) || 2.minutes
      @kml = File.open(file)
      @list = extract_list_from_kml
    end

    def locate_at(date)
      date = DateTime.parse(date).utc
      @list.select { |key, _value| key <= date && key >= date - @max_distance_time }.to_a.last.try(:last) ||
        @list.select { |key, _value| key >= date && key <= date + @max_distance_time }.to_a.first.try(:last)
    end

    private

    def extract_list_from_kml
      Nokogiri::XML(@kml).search('when')
        .map { |e| { (DateTime.parse(e.text).utc) => e.next_element.text } }
        .reduce({}, :merge)
        .sort.to_h
    end
  end
end
