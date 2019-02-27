class HighlightBuilder
  def initialize(route:, radius:, processor:DBHighlightProcessor)
    @route = route
    @radius = radius
  end

  def calc
    route.map do |coordinate|
      processor.calc(coordinate.latitude, coordinate.longitude, radius: radius)
    end
  end
  
end