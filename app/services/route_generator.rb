class RouteGenerator
  attr_reader :start_coordinate, :end_coordinate

  # RouteGenerator.new(start_coordinate: [38.7223249,-9.1393372], end_coordinate: [38.7224531,-9.1389943])
  def initialize(start_coordinate:, end_coordinate:)
    @start_coordinate = start_coordinate
    @end_coordinate = end_coordinate
  end

  def calc
    # api_key = ENV['GOOGLE_GEOCODER_API']
    origin = start_coordinate.join(', ').gsub(',', '+')
    destination = end_coordinate.join(',').gsub(',', '+')

  #  # Setup global parameters
  # GoogleMapsService.configure do |config|
  #   config.key = api_key
  #   config.retry_timeout = 20
  #   config.queries_per_second = 10
  # end

  # Initialize client using global parameters
  
  gmaps = GoogleMapsService::Client.new
  routes = gmaps.directions(
    "#{origin}",
    "#{destination}",
    mode: 'driving',
    alternatives: false)

  polyline = routes[0][:overview_polyline]

  # Decode polyline

  encoded_path = polyline[:points]
  path = GoogleMapsService::Polyline.decode(encoded_path)
  #=> [{:lat=>38.5, :lng=>-120.2}, {:lat=>40.7, :lng=>-120.95}, {:lat=>43.252, :lng=>-126.45300000000002}]

  end

end