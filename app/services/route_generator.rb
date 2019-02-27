class RouteGenerator
  attr_reader :start_coordinate, :end_coordinate

  # ex: RouteGenerator.new(start_coordinate: [2312,213123], end_coordinate: [23123,1231])
  def initialize(start_coordinate:, end_coordinate:)
    @start_coordinate = start_coordinate
    @end_coordinate = end_coordinate
  end

  def calc
    # lógica de pegar nas coordenadas, fazer a chamada
    # ao google maps e aquilo há-de retornar uma rota ou várias
  end
end