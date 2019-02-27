class HighlightStruct
  attr_reader :name, :lat, :lon
  
  def initialize(name: nil, lat:, lon:)
    @name = name
    @lat = lat
    @lon = lon
  end

end