class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  has_many :bookings, dependent: :destroy

  def self.format_dates(type)
    flights = Flight.select(:start_datetime).distinct.limit(10)

    case type
    when :day
      flights = flights.map { |f| [f.start_datetime.strftime('%d'), f.start_datetime.strftime('%d').to_i]}
    when :month
      flights = flights.map { |f| [f.start_datetime.strftime('%m'), f.start_datetime.strftime('%m').to_i]}
    when :year
      flights = flights.map { |f| [f.start_datetime.strftime('%Y'), f.start_datetime.strftime('%Y').to_i]}
    else
      raise 'must pass in day, month, or year as a symbol'
    end

    flights.uniq
  end

  def self.find_flights(departure_airport_id:, arrival_airport_id:, flight_date:)
    Flight.where(departure_airport_id: departure_airport_id.to_i)
          .where(arrival_airport_id: arrival_airport_id.to_i)
          .where(start_datetime: (flight_date..(flight_date + (60 * 60 * 24) - 1))) # checks between midnight and 11:59 PM
  end
end
