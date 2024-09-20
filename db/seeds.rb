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
user1 = User.create!(username: "bernardman", email: "bernard@gmail.com", password: "bernard@gmail.com")
user2 = User.create!(username: "ashleynew", email: "ashleynew@gmail.com", password: "ashleynew@gmail.com")
user3 = User.create!(username: "chefsteve", email: "chefsteve@gmail.com", password: "chefsteve@gmail.com")
user4 = User.create!(username: "cookmaster", email: "cookmaster@gmail.com", password: "cookmaster@gmail.com")
user5 = User.create!(username: "foodlover", email: "foodlover@gmail.com", password: "foodlover@gmail.com")
# Create categories with Cloudinary images
puts "Creating categories with Cloudinary images"
categories = [
  { name: "Baking", description: "Recipes for bread, cakes, and baked goods.", image_url: "https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?q=80&w=1470&auto=format&fit=crop" },
  { name: "Pasta", description: "Delicious pasta dishes for every occasion.", image_url: "https://images.unsplash.com/photo-1498579150354-977475b7ea0b?q=80&w=1470&auto=format&fit=crop" },
  { name: "Breakfast", description: "Morning meals to start your day off right.", image_url: "https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?q=80&w=1470&auto=format&fit=crop" },
  { name: "Healthy", description: "Nutrient-packed meals to fuel your body.", image_url: "https://images.unsplash.com/photo-1467453678174-768ec283a940?q=80&w=1444&auto=format&fit=crop" },
  { name: "Quick & Easy", description: "Simple, fast recipes for busy days.", image_url: "https://images.unsplash.com/photo-1626201853398-7cba6a8ebd7f?q=80&w=1470&auto=format&fit=crop" },
  { name: "Kidz Nibbles", description: "Fun and healthy meals for children.", image_url: "https://images.unsplash.com/photo-1627662056036-0ca39e8c61d4?q=80&w=1470&auto=format&fit=crop" },
  { name: "Desserts", description: "Sweet courses to end a meal.", image_url: "https://images.unsplash.com/photo-1522906456132-bac22adad34e?q=80&w=1470&auto=format&fit=crop" },
  { name: "Vegetarian", description: "Meals without meat or fish.", image_url: "https://images.unsplash.com/photo-1597362925123-77861d3fbac7?q=80&w=1470&auto=format&fit=crop" },
  { name: "Salads", description: "Fresh and flavorful salads.", image_url: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2FsYWR8ZW58MHx8MHx8fDA%3D" },
  { name: "Soups", description: "Hearty and warm soups for any season.", image_url: "https://images.unsplash.com/photo-1621608953630-00d9eb860392?q=80&w=869&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" }
]
categories.each do |cat|
  category = Category.new(name: cat[:name], description: cat[:description], user_id: [user1.id, user2.id, user3.id, user4.id, user5.id].sample)
  category.photo.attach(io: URI.open(cat[:image_url]), filename: File.basename(URI.parse(cat[:image_url]).path))
  p "category made"
  category.save!
end
# Create recipes with Cloudinary images
puts "Creating recipes with Cloudinary images"
recipes = [
  { title: "Grandma's Banana Bread", ingredients: "Bananas, Flour, Sugar, Butter, Eggs", method: "A moist banana bread.", image_url: "https://images.unsplash.com/photo-1606101204735-85ad3a8bfd81?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Baking" },
  { title: "Spaghetti Bolognaise", ingredients: "Spaghetti, Eggs, Parmesan, Pancetta", method: "A classic Italian pasta dish.", image_url: "https://images.unsplash.com/photo-1673442635965-34f1b36d8944?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3BhZ2hldHRpfGVufDB8fDB8fHww", category_name: "Pasta" },
  { title: "Pancakes to die for!!", ingredients: "Flour, Milk, Eggs, Sugar", method: "Fluffy morning pancakes.", image_url: "https://images.unsplash.com/photo-1489489993638-b9e1eff5cd6d?q=80&w=435&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Breakfast" },
  { title: "Avocado Toast", ingredients: "Avocados, Bread, Olive Oil", method: "Simple and healthy avocado toast.", image_url: "https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?q=80&w=872&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Healthy" },
  { title: "Grilled Cheese", ingredients: "Bread, Cheese, Butter", method: "A quick and delicious grilled cheese sandwich.", image_url: "https://images.unsplash.com/photo-1528736235302-52922df5c122?q=80&w=954&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Quick & Easy" },
  { title: "Incredible Chocolate Cake", ingredients: "Flour, Sugar, Cocoa Powder, Eggs", method: "A rich and moist chocolate cake.", image_url: "https://images.unsplash.com/photo-1590080875795-d1150371b9f3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHx8MA%3D%3D", category_name: "Desserts" },
  { title: "Vegetable Stir Fry", ingredients: "Mixed Vegetables, Soy Sauce, Garlic", method: "A simple vegetarian stir fry.", image_url: "https://images.unsplash.com/photo-1669863329825-6e4e39ce752c?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Vegetarian" },
  { title: "Caesar Salad", ingredients: "Romaine, Croutons, Caesar Dressing", method: "A classic Caesar salad.", image_url: "https://images.unsplash.com/photo-1512852939750-1305098529bf?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Flc2FyJTIwc2FsYWR8ZW58MHx8MHx8fDA%3D", category_name: "Salads" },
  { title: "Tomato Soup", ingredients: "Tomatoes, Basil, Garlic", method: "A smooth and flavorful tomato soup.", image_url: "https://images.unsplash.com/photo-1629978448078-c94a0ab6500f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dG9tYXRvJTIwc291cHxlbnwwfHwwfHx8MA%3D%3D", category_name: "Soups" },
  { title: "Cheezy Lasagna", ingredients: "Lasagna Noodles, Meat Sauce, Cheese", method: "A hearty and satisfying lasagna.", image_url: "https://images.unsplash.com/photo-1713802611143-d14c927e2217?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGxhc2FnbmF8ZW58MHx8MHx8fDA%3D", category_name: "Pasta" },
  { title: "Tik Tok French Toast", ingredients: "Bread, Eggs, Milk, Cinnamon", method: "Delicious French toast with a hint of cinnamon.", image_url: "https://images.unsplash.com/photo-1631359544940-535dcc2dc72c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZnJlbmNoJTIwdG9hc3R8ZW58MHx8MHx8fDA%3D", category_name: "Breakfast" },
  { title: "Tacos", ingredients: "Tortillas, Meat, Cheese, Lettuce", method: "A quick and easy taco recipe.", image_url: "https://images.unsplash.com/photo-1514843319620-4f042827c481?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Quick & Easy" },
  { title: "AMAZING Apple Pie", ingredients: "Apples, Flour, Butter, Sugar", method: "A classic apple pie recipe.", image_url: "https://images.unsplash.com/photo-1601000938365-f182c5ec2f77?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXBwbGUlMjBwaWV8ZW58MHx8MHx8fDA%3D", category_name: "Desserts" },
  { title: "Hearty Minestrone Soup", ingredients: "Mixed Vegetables, Pasta, Beans", method: "A hearty minestrone soup.", image_url: "https://images.unsplash.com/photo-1603105037880-880cd4edfb0d?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Soups" },
  { title: "Best Vegan Burger", ingredients: "Vegan Patty, Lettuce, Tomato", method: "A tasty and healthy vegan burger.", image_url: "https://images.unsplash.com/photo-1684243841385-18c29dd5ab29?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHZlZ2FuJTIwYnVyZ2VyfGVufDB8fDB8fHww", category_name: "Vegetarian" },
  { title: "Chicken Alfredo", ingredients: "Pasta, Chicken, Alfredo Sauce", method: "A creamy and delicious chicken Alfredo.", image_url: "https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2hpY2tlbiUyMGFsZnJlZG98ZW58MHx8MHx8fDA%3D", category_name: "Pasta" },
  { title: "Fruit Salad", ingredients: "Mixed Fruits, Honey", method: "A simple and refreshing fruit salad.", image_url: "https://images.unsplash.com/photo-1613082487279-1e16f1e81505?q=80&w=1752&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Salads" },
  { title: "Cupcakes", ingredients: "Flour, Sugar, Butter, Eggs", method: "Delicious vanilla cupcakes.", image_url: "https://images.unsplash.com/photo-1509512738205-712eca26a2ea?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", category_name: "Baking" },
  { title: "Chocolate fudge brownies", ingredients: "Chocolate, Flour, Sugar, Eggs", method: "Rich and fudgy chocolate brownies.", image_url: "https://images.unsplash.com/photo-1607920592591-aebc36b403ad?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnJvd25pZXN8ZW58MHx8MHx8fDA%3D", category_name: "Desserts" } ]
  recipes.each do |rec|
    # Find the corresponding category by name
    category = Category.find_by(name: rec[:category_name])
    # Create the recipe with the same user_id as the associated category
    recipe = Recipe.new(
      title: rec[:title],
      ingredients: rec[:ingredients],
      method: rec[:method],
      user_id: category.user_id, # Match the user_id to the category's user
      categories: [category]
    )
    # Attach the image
    recipe.photo.attach(io: URI.open(rec[:image_url]), filename: File.basename(URI.parse(rec[:image_url]).path))
    recipe.save!
    puts "Recipe created: #{recipe.title} under #{category.name} by user #{category.user.username}"
  end
