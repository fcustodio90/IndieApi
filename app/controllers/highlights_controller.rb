class HighlightsController < ApplicationController
  
  def show
    # params from URL
    lat = params[:lat].to_f
    lon = params[:lon].to_f

    highlight = Highlight.near("#{lat},#{lon}").limit(1).first
    render json: highlight, status: :ok  
  end

end
