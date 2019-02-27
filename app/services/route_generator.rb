class RouteGenerator
  attr_reader :start_coordinate, :end_coordinate

  # RouteGenerator.new(start_coordinate: [38.7223249,-9.1393372], end_coordinate: [38.7224531,-9.1389943])
  def initialize(start_coordinate:, end_coordinate:)
    @start_coordinate = start_coordinate
    @end_coordinate = end_coordinate
  end

  def calc
  # Initialize client using global parameters
  gmaps = GoogleMapsService::Client.new
  routes = gmaps.directions(
    "#{start_coordinate[0]},#{start_coordinate[1]}",
    "#{end_coordinate[0]},#{end_coordinate[1]}",
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

  HighlightBuilder.new(route: route, radius: 10).calc
  end

end