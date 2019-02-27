class HighlightBuilder
  attr_reader :route, :radius, :processor

  def initialize(route:, radius:, processor: HighlightProcessor::Database)
    @route = route
    @radius = radius
    @processor = processor
  end

  def calc
    results = []
    route.map do |coordinate|
      results << processor.call(lat: coordinate.lat, lon: coordinate.lon, radius: radius)
    end
    results.flatten.uniq { |highlight| highlight.name }
  end
  
end