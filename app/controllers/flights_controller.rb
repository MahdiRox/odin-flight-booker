class FlightsController < ApplicationController

 def index
    @airports = Airport.pluck(:code, :id) 
    load_flight_dates
 end



 def load_flight_dates
    # Fetch unique flight dates based on start_datetime and flight_duration
    flight_dates = Flight.pluck(:start_datetime).uniq
    @flight_dates = flight_dates.map { |date| [date.strftime('%Y-%m-%d'), date] }
 end




end
