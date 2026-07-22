class BookingsController < ApplicationController
  def new
    @passengers_number = booking_params[:passengers]
    @flight_id = booking_params[:flight_id]
    @flight_number = Flight.find(booking_params[:flight_id]).flight_number

    @booking = Booking.new
    @passengers_number.to_i.times { @booking.passengers.build }
  end

  private

  def booking_params
    params.permit(:passengers, :flight_id)
  end
end
