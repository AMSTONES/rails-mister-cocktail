# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

json = open(url).read

drinks = JSON.parse(json)
# p drinks['drinks'].class
drinks["drinks"].each do |array|
  Ingredient.create(name: array["strIngredient1"])
end

10.times do
  Cocktail.create(name: "Booze#{rand(1..100)}")
end
