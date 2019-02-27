class RoutesController < ApplicationController
  
  def show
    if params[:radius].nil?
      highlights = RouteGenerator.new(starting_point: params[:start_point], ending_point: params[:end_point]).calc
    else
      highlights = RouteGenerator.new(starting_point: params[:start_point], ending_point: params[:end_point], radius: params[:radius]).calc
    end    
    render json: highlights, status: :ok
  end

end
