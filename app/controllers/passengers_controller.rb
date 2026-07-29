class PassengersController < ApplicationController
  def create
    @booking = Booking.find(passenger_params[:booking_id])
    @passenger = @booking.passengers.build(passenger_params)

    respond_to do |format|
      if @passenger.save
        format.turbo_stream
      else
        format.html { redirect_to booking_path(@booking), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @passenger = Passenger.find(passenger_url_params[:id])

    respond_to do |format|
     if @passenger.destroy
       format.turbo_stream
     else
       format.html { redirect_to booking_path(@passenger.booking_id), status: :unprocessable_entity }
     end
   end
  end

  private

  def passenger_params
    params.expect(passenger: [ :booking_id, :name, :email ])
  end

  def passenger_url_params
    params.permit(:id)
  end
end
