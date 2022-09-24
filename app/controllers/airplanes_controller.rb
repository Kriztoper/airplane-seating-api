class AirplanesController < ApplicationController

  def index
    airplanes = Airplane.all
    render json: airplanes, except: [:created_at, :updated_at]
  end

  def show
    airplane = Airplane.find(params[:id])
    render json: airplane, except: [:created_at, :updated_at]
  end

end
