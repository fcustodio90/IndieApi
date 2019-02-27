class HighlightsController < ApplicationController
  
  def show
  lat = params[:lat].to_f
  lon = params[:lon].to_f
  highlights = Highlight.near("#{lat},#{lon}")
  render json: highlights, status: :ok  
  end

end
