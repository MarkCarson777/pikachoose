# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "creating user..."

User.create!(
  email: "bentorama@gmail.com",
  password: "password"
)

puts "user created"

puts "creating Pokemon..."

50.times do
  Pokemon.create!(
    name: Faker::Games::Pokemon.name,
    category: ["Normal", "Fire", "Water", "Grass", "Electric", "Ice", "Fighting", "Poison", "Ground", "Flying", "Psychic", "Bug", "Rock", "Ghost", "Dragon"].sample,
    price: Faker::Number.decimal_part(digits: 3),
    user: User.first
  )
end
puts "finished seeding"
