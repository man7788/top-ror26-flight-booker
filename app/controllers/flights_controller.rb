class FlightsController < ApplicationController
  def index
    departure_airports = Airport.joins(:departing_flights).order(:name).distinct
    arrival_airports = Airport.joins(:arriving_flights).order(:name).distinct
    flight_datetimes = Flight.order(:start_datetime).distinct

    @flights = Flight.where(flight_params) if params[:departure_airport_id]
    @departure_airports = departure_airports.includes(:departing_flights).map { |a| [ a.name, a.id ] }
    @arrival_airports = arrival_airports.includes(:arriving_flights).map { |a| [ a.name, a.id ] }
    @passengers = (1..4).map { |i| [ i, i ] }
    @flight_datetimes = flight_datetimes.map { |f| [ f.start_datetime.strftime("%d %b %Y %H:%M"), f.start_datetime ] }
  end

  private

  def flight_params
    params.permit(:departure_airport_id, :arrival_airport_id, :start_datetime)
  end
end
