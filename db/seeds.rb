# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

address_array = []
postcode_array = []
csv_options = { headers: :first_row, header_converters: :symbol }
CSV.foreach('./app/assets/data/uk-500.csv', csv_options) do |row|
  address = "#{row[:address]}, #{row[:city]}"
  address_array << address
  postcode_array << row[:postal]
end

puts "cleaning database..."
Pokemon.destroy_all
User.destroy_all
Booking.destroy_all

puts "creating users..."

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "users created"

puts "creating Pokemon..."

@users = User.all

@users.each do |user|
  5.times do
    index = rand(479)
    Pokemon.create!(
      name: Faker::Games::Pokemon.name,
      category: ["Normal", "Fire", "Water", "Grass", "Electric", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon"].sample,
      price: Faker::Number.decimal_part(digits: 3),
      user: user,
      street_address: address_array[index],
      address: "#{postcode_array[index]}, UK"
    )
  end
end

puts "pokemon created."

puts "creating bookings..."

@pokemons = Pokemon.all
@pokemons.each do |pokemon|
    @users.each do |user|
        Booking.create!(
          user: user,
          pokemon: pokemon,
          start_date: DateTime.new(2009,9,1,17),
          end_date: DateTime.new(2009,9,1,19)
        )
    end
end

puts "created bookings!"

puts "creating battle messages..."

first_message = { title: "Heading to Pewter City Gym", description: "Anyone up for a battle? I have 3 great pokemon that I'm looking to evolve soon. TIA.", user: User.last  }
second_message = { title: "Looking for a Water Pokemon Fight", description: "Hi, I am a water pokemon specialist, looking for others who would be happy to give me battle experience.", user: User.last }

[first_message, second_message].each do |attributes|
  message = Message.create!(attributes)
end

puts "all done - wahey!"
