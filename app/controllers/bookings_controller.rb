class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: @flight.id)
    total_passengers = params[:total_passengers].to_i
    total_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create!(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
