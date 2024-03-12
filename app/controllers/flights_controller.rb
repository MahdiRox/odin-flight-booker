class FlightsController < ApplicationController

 def index
    @airports = Airport.pluck(:code, :id) 
    if params[:departure_airport_id].present? || params[:arrival_airport_id].present? || params[:date].present? || params[:num_tickets].present?
      # Use the Flight model's search method to filter flights based on the provided parameters
      @flights = Flight.search(params)
    else
      @flights = []
    end

    load_flight_dates
 end



 def load_flight_dates
    # Fetch unique flight dates based on start_datetime and flight_duration
    flight_dates = Flight.pluck(:start_datetime).uniq
    @flight_dates = flight_dates.map { |date| [date.strftime('%Y-%m-%d')] }
 end




end
