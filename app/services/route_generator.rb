class RouteGenerator
  attr_reader :starting_point, :ending_point, :radius

  # RouteGenerator.new(start_coordinate: [38.7223249,-9.1393372], end_coordinate: [38.7224531,-9.1389943])
  def initialize(starting_point:, ending_point:, radius: 20)
    @starting_point = starting_point
    @ending_point = ending_point
    @radius = radius
  end

  def calc
  # Initialize client using global parameters
  gmaps = GoogleMapsService::Client.new
  routes = gmaps.directions(
    "#{starting_point}",
    "#{ending_point}",
    mode: 'driving',
    alternatives: false)

  polyline = routes[0][:overview_polyline]

  # Decode polyline

  encoded_path = polyline[:points]
  path = GoogleMapsService::Polyline.decode(encoded_path)
  #=> [{:lat=>38.5, :lng=>-120.2}, {:lat=>40.7, :lng=>-120.95}, {:lat=>43.252, :lng=>-126.45300000000002}]
  
  route = path.map do |object|
    RouteStruct.new(
      lat: object[:lat],
      lon: object[:lng]
    )
  end

  HighlightBuilder.new(route: route, radius: radius).calc
  end

end