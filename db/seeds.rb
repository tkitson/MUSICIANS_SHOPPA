# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
Service.destroy_all
Booking.destroy_all

puts 'Creating 30 fake users...'
30.times do
  user = User.new(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end
puts 'Finished!'

puts 'Creating 20 fake services...'
20.times do
  service = Service.new(
    genre: Faker::Music.genre,
    price: rand(1.0..1000.1),
    details: Faker::TvShows::GameOfThrones.quote,
    address: Faker::Address.full_address,
    user_id: rand(1..20)
  )
  service.save!
end
puts 'Finished!'

puts 'Creating 10 fake bookings...'
10.times do
  booking = Booking.new(
    status: [true, false].sample,
    start_date: Faker::Date.between(from: '2022-11-26', to: '2023-01-25'),
    end_date: Faker::Date.between(from: '2022-11-26', to: '2023-01-25'),
    user_id: rand(1..20),
    service_id: rand(1..20)
  )
  booking.save!
end
puts 'Finished!'
