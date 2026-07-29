class PassengersController < ApplicationController
  def create
    @booking = Booking.find(passenger_params[:booking_id])
    @passenger = @booking.passengers.build(passenger_params)

    if @passenger.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def passenger_params
    params.expect(passenger: [ :booking_id, :name, :email ])
  end
end
