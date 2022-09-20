class SeatsController < ApplicationController

  def index
    seats = Seat.all
    render json: seats, except: [:created_at, :updated_at]
  end

end
