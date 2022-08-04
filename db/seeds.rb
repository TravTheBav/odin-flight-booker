# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all

Airport.create!([
  {
    code: "JFK"
  },
  {
    code: "SAT"
  },
  {
    code: "LAX"
  }
])

Flight.create!([
  {
    departure_airport_id: Airport.first.id,
    arrival_airport_id: Airport.last.id,
    start_datetime: Time.now,
    flight_duration: 6.0
  },
  {
    departure_airport_id: Airport.last.id,
    arrival_airport_id: Airport.first.id,
    start_datetime: Time.now.next_day,
    flight_duration: 6.0
  }
])

p "#{Airport.count} airports created"
p "#{Flight.count} flights created"
