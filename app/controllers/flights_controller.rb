class FlightsController < ApplicationController
  def index
    @airport_options = Airport.select(:code, :id).map { |a| [a.code, a.id] }
    @passenger_options = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]
    @flight_day_options = Flight.format_dates(:day)
    @flight_month_options = Flight.format_dates(:month)
    @flight_year_options = Flight.format_dates(:year)

    if params[:commit].present? # if a search was entered
      @flights = Flight.find_flights(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
        flight_date: Time.parse(format_date_from_params)
      )
    else # when index page was reached without a search
      @flights = []
    end
  end

  private

  def format_date_from_params
    params[:flight_date][2] + '-' +
    params[:flight_date][1].rjust(2, '0') + '-' +
    params[:flight_date][0].rjust(2, '0')
  end
end
