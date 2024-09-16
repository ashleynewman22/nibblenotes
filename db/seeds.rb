# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
# Seed data using Cloudinary URLs for images
require 'open-uri'

puts "Clearing database"
RecipeCategory.destroy_all
Note.destroy_all
Recipe.destroy_all
Category.destroy_all
User.destroy_all
# Create users
puts "Creating Users"
user1 = User.create!(
  email: "bernard@gmail.com",
  password: "bernard@gmail.com"
)
user2 = User.create!(
  email: "ashleynew@gmail.com",
  password: "ashleynew@gmail.com"
)
# Create categories with Cloudinary images
puts "Creating categories with Cloudinary images"
categories = [
  { name: "Baking", description: "Recipes for bread, cakes, and baked goods.", image_url: "https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Pasta", description: "Delicious pasta dishes for every occasion.", image_url: "https://images.unsplash.com/photo-1498579150354-977475b7ea0b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Breakfast", description: "Morning meals to start your day off right.", image_url: "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Healthy", description: "Nutrient-packed meals to fuel your body.", image_url: "https://images.unsplash.com/photo-1467453678174-768ec283a940?q=80&w=1444&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Easy & Quick", description: "Simple, fast recipes for busy days.", image_url: "https://images.unsplash.com/photo-1626201853398-7cba6a8ebd7f?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Kidz Nibbles", description: "Fun and healthy meals for children.", image_url: "https://images.unsplash.com/photo-1627662056036-0ca39e8c61d4?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Desserts", description: "Sweet courses to end a meal.", image_url: "https://images.unsplash.com/photo-1522906456132-bac22adad34e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
  { name: "Vegetarian", description: "Meals without meat or fish.", image_url: "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" }
]
categories.each do |cat|
  category = Category.create!(name: cat[:name], description: cat[:description], user_id: [user1.id, user2.id].sample)
  category.photo.attach(io: URI.open(cat[:image_url]), filename: File.basename(URI.parse(cat[:image_url]).path))
end
# Create recipes with Cloudinary images
puts "Creating recipes with Cloudinary images"
recipes = [
  { title: "Banana Bread", ingredients: "Bananas, Flour, Sugar, Butter, Eggs", method: "A moist banana bread.", image_url: "https://images.unsplash.com/photo-1497534547324-0ebb3f052e88?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Baking" },
  { title: "Spaghetti Carbonara", ingredients: "Spaghetti, Eggs, Parmesan, Pancetta", method: "A classic Italian pasta dish.", image_url: "https://images.unsplash.com/photo-1588013273468-315fd88ea34c?q=80&w=1469&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Pasta" }
]
recipes.each do |recipe_data|
  category = Category.find_by(name: recipe_data[:category_name])
  recipe = Recipe.create!(
    title: recipe_data[:title],
    ingredients: recipe_data[:ingredients],
    method: recipe_data[:method],
    user: category.user, # Ensure recipe user is the same as the category user
    categories: [category]
  )
  recipe.photo.attach(io: URI.open(recipe_data[:image_url]), filename: File.basename(URI.parse(recipe_data[:image_url]).path))
end
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Recipe.count} recipes created"
puts "#{Note.count} notes created"
puts "Seeding complete!"
