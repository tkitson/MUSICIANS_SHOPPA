# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

User.destroy_all
Service.destroy_all
Booking.destroy_all

puts 'Creating 30 fake users...'
30.times do
  file = URI.open("https://source.unsplash.com/random/?musician")
  user = User.new(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.photo.attach(io: file, filename: "#{user.name}.png", content_type: "image/png")
  user.save!
  p "#{user.name} created"
end
puts 'Finished!'

puts 'Creating 20 fake services...'
20.times do
  service = Service.new(
    genre: Faker::Music.genre,
    price: rand(1.0..1000.1),
    details: Faker::TvShows::GameOfThrones.quote,
    address: Faker::Address.state,
    user: User.all.sample
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
    user: User.all.sample,
    service: Service.all.sample
  )
  booking.save!
end
puts 'Finished!'
