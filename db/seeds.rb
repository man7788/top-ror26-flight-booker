# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "NYC", "LHR", "NRT", "TPE", "HKG", "SIN" ].each do |a|
  Airport.find_or_create_by!(name: a)
end

Flight.create!([
  { start_datetime: "2026-12-25T20:45:00Z", flight_number: "AA111", flight_duration:  240, departure_airport_id: 1, arrival_airport_id: 6 },
  { start_datetime: "2026-11-27T10:15:00Z",  flight_number: "BB222", flight_duration:  120, departure_airport_id: 2, arrival_airport_id: 5 },
  { start_datetime: "2026-8-15T13:10:00Z", flight_number: "CC333", flight_duration:  60, departure_airport_id: 3, arrival_airport_id: 4 }
])
