class BookingsController < ApplicationController
  def new
    @passengers_number = booking_params[:passengers]
    @flight_id = booking_params[:flight_id]
    @flight_number = Flight.find(booking_params[:flight_id]).flight_number

    @booking = Booking.new
    @passengers_number.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new
    @booking.flight_id = passenger_params[:flight_id]

    @passengers = passenger_params[:passengers].to_i.times.with_index do |i|
      @booking.passengers.build(passenger_params[:passengers_attributes][i.to_s])
    end

    if @booking.save
      @flight = Flight.find(passenger_params[:flight_id])
      @booking.passengers.each do |p|
        PassengerMailer.with(user: p, flight: @flight).confirmation_email.deliver_later
      end
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity

    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.joins(:bookings).where(bookings: { id: params[:id] }).first
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.permit(:passengers, :flight_id)
  end

  def passenger_params
    params.expect(booking: [ :flight_id, :passengers, passengers_attributes: [ [ :name, :email ] ] ])
  end
end
