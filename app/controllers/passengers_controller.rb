class PassengersController < ApplicationController
  def create
    @booking = Booking.find(passenger_params[:booking_id])
    @passenger = @booking.passengers.build(passenger_params)

    respond_to do |format|
     if @passenger.save
       format.turbo_stream
     else
       format.html { render :new, status: :unprocessable_entity }
     end
   end
  end

  private

  def passenger_params
    params.expect(passenger: [ :booking_id, :name, :email ])
  end
end
