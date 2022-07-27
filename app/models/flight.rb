class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.all_distinct
    Flight.select(:start_datetime).distinct
  end

  def self.format_dates(type)
    flights = Flight.all_distinct

    case type
    when :day
      flights.map { |f| [f.start_datetime.strftime('%d'), f.start_datetime.strftime('%d').to_i]}
    when :month
      flights = flights.map { |f| [f.start_datetime.strftime('%m'), f.start_datetime.strftime('%m').to_i]}
      flights.uniq
    when :year
      flights = flights.map { |f| [f.start_datetime.strftime('%y'), f.start_datetime.strftime('%y').to_i]}
      flights.uniq
    else
      raise 'must pass in day, month, or year as a symbol'
    end
  end
end
