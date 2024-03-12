# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.delete_all
Flight.delete_all

airports_data = [
  { code: 'SFO', name: 'San Francisco International Airport' },
  { code: 'JFK', name: 'John F. Kennedy International Airport' },
  { code: 'LAX', name: 'Los Angeles International Airport' },
  { code: 'ORD', name: 'O\'Hare International Airport' },
  { code: 'ATL', name: 'Hartsfield-Jackson Atlanta International Airport' }
]

airports_data.each do |airport|
    Airport.create(airport)
end

flights_data = [
    { departure_airport_id: Airport.find_by(code: 'SFO').id, arrival_airport_id: Airport.find_by(code: 'JFK').id, start_datetime: DateTime.now, flight_duration: 2.houres },
    { departure_airport_id: Airport.find_by(code: 'SFO').id, arrival_airport_id: Airport.find_by(code: 'JFK').id, start_datetime: DateTime.now + 44.minutes, flight_duration: 2.houres },
    { departure_airport_id: Airport.find_by(code: 'SFO').id, arrival_airport_id: Airport.find_by(code: 'JFK').id, start_datetime: DateTime.now + 1.seconds, flight_duration: 2.houres },
    { departure_airport_id: Airport.find_by(code: 'JFK').id, arrival_airport_id: Airport.find_by(code: 'LAX').id, start_datetime: DateTime.now + 1.day, flight_duration: 5.houres },
    { departure_airport_id: Airport.find_by(code: 'LAX').id, arrival_airport_id: Airport.find_by(code: 'ORD').id, start_datetime: DateTime.now + 2.days, flight_duration: 4.houres },
  # Add more flights as needed
]
flights_data.each do |flight|
    Flight.create(flight)
    puts "Created flight from #{flight[:departure_airport_id]} to #{flight[:arrival_airport_id]}"
end  

