class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"
    has_many :bookings
    has_many :passengers, through: :bookings


    def self.search(params)
        flights = Flight.all
        flights = flights.where(departure_airport_id: params[:departure_airport_id]) if params[:departure_airport_id].present?
        flights = flights.where(arrival_airport_id: params[:arrival_airport_id]) if params[:arrival_airport_id].present?
        flights = flights.where("DATE(start_datetime) = ?", params[:date].to_date) if params[:date].present?
        # flights = flights.where("num_tickets >= ?", params[:passenger_count].to_i) if params[:num_tickets].present?
        flights
    end
end
