# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "destroying previous seeds..."
Ingredient.destroy_all
Cocktail.destroy_all

puts "Creating ingredients"

data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
response = JSON.parse(data)

drinks = response["drinks"]

drinks.each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

puts "Seed complete"

Ingredient.all.each do |ingredient|
  puts ingredient.name
end

Cocktail.create(name: "Bob")
Cocktail.create(name: "Sara")
Cocktail.create(name: "Bob1")
Cocktail.create(name: "Sara1")
Cocktail.create(name: "Bob2")
Cocktail.create(name: "Sara2")
Cocktail.create(name: "Bob3")
Cocktail.create(name: "Sara3")
