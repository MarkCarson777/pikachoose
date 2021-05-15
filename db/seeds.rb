# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    Pokemon.create!(
      name: Faker::Games::Pokemon.name,
      category: ["Normal", "Fire", "Water", "Grass", "Electric", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon"].sample,
      price: Faker::Number.decimal_part(digits: 3),
      user: user
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
puts "all done - wahey!"
