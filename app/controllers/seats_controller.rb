class SeatsController < ApplicationController

  def index
    seats = Seat.all
    render json: seats, except: [:created_at, :updated_at]
  end

  def assign_seats
    num_passengers = params[:num_passengers].to_i
    seats_dimensions = eval(params[:seats_dimensions].to_s)
    service = AssignSeatService.new
    assigned_seats = service.assign seats_dimensions, num_passengers
    print "\nOutput for API:"
    Array2dUtils.array_2D_print assigned_seats
    render json: assigned_seats
  end

end
