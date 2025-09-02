class BookingsController < ApplicationController
    def new
        @flight = Flight.find(params[:flight_id])
        @booking = Booking.new
        # params[:passengers].to_i.times { @booking.passengers.build }
        @passenger_count = params[:passengers].to_i

        # Build passengers associated with the booking
        @passenger_count.times { @booking.passengers.build }
    end
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |p|
        PassengerMailer.with(passenger: p).confirmation_email.deliver_now
      end
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end

end