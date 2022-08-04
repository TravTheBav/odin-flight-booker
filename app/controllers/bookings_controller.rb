class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: @flight.id)
    total_passengers = params[:total_passengers].to_i
    total_passengers.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.valid?
      flash[:notice] = 'Your trip has been booked'
      redirect_to booking_path(@booking)
    else
      flash[:errors] = @booking.errors.full_messages
      redirect_to new_booking_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
