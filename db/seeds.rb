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

# Create categories
puts "Creating categories"
category1 = Category.create!(
  name: "Vegetarian",
  description: "Dishes that do not include meat or fish.",
  user_id: user2.id
)

category2 = Category.create!(
  name: "Desserts",
  description: "Sweet courses typically eaten at the end of a meal.",
  user_id: user1.id
)

category3 = Category.create!(
  name: "Dinner",
  description: "Nutritious meals to end off the day.",
  user_id: user2.id
)

# Create recipes
puts "Creating recipes"
recipe1 = Recipe.create!(
  title: "Vegetable Stir Fry",
  ingredients: "Broccoli, Carrots, Bell Peppers, Soy Sauce, Garlic",
  description: "A healthy stir fry with fresh vegetables and soy sauce.",
  user_id: user2.id
)

recipe2 = Recipe.create!(
  title: "Chocolate Cake",
  ingredients: "Flour, Cocoa Powder, Eggs, Sugar, Butter",
  description: "A rich and moist chocolate cake.",
  user_id: user1.id
)

# Assign categories to recipes
puts "Assigning recipes to categories"
RecipeCategory.create!(recipe: recipe1, category: category1)
RecipeCategory.create!(recipe: recipe2, category: category2)

# Create notes
puts "Adding Notes"
Note.create!(
  content: "Try adding tofu to the stir fry for more protein.",
  recipe_id: recipe1.id
)

Note.create!(
  content: "The chocolate cake needs more sugar for a sweeter taste.",
  recipe_id: recipe1.id
)
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Recipe.count} recipes created"
puts "#{Note.count} notes created"

puts "Seeding complete!"
