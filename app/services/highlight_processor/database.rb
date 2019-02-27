class HighlightProcessor::Database < HighlightProcessor
  def call
    results = []
    Highlight.near([lat, lon], radius, units: :km).find_each do |highlight|
      results << HighlightStruct.new(name: highlight.name, lat: highlight.lat, lon: highlight.lon)
    end
    results
  end
end

class HighlightBuilder
  attr_reader :route, :radius, :processor

  def initialize(route:, radius:, processor: HighlightProcessor::Database)
    @route = route
    @radius = radius
    @processor = processor
  end

  def calc
    route.map do |coordinate|
      processor.calc(lat: coordinate.latitude, lon: coordinate.longitude, radius: radius)
    end
  end
end