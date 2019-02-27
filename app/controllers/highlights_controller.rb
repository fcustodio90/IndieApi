class HighlightsController < ApplicationController
  
  def show
    # params from URL
    lat = params[:lat].to_f
    lon = params[:lon].to_f
    # results array with highlights
    results = Highlight.near("#{lat},#{lon}")
    # sort by distance
    results.sort_by{|highlight| highlight.distance }
    # closest highlight
    highlights = results.first
    render json: highlights, status: :ok  
  end

end
