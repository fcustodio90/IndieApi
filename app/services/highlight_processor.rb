class HighlightProcessor
  attr_reader :lat, :lon, :radius

  def self.call(lat:, lon:, radius:)
    new(lat, lon, radius).call
  end

  def initialize(lat, lon, radius)
    @lat = lat
    @lon = lon
    @radius = radius
  end

  def call
    raise "Implement this"
  end

