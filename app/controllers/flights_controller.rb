class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @passenger_options = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]
    @flight_day_options = Flight.format_dates(:day)
    @flight_month_options = Flight.format_dates(:month)
    @flight_year_options = Flight.format_dates(:year)
  end
end
