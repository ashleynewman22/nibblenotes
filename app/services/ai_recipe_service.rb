# app/services/ai_recipe_service.rb

class AiRecipeService
  def initialize(ingredients:, recipe_type:, user:)
    @ingredients = ingredients
    @recipe_type = recipe_type
    @user = user
    @client = OpenAI::Client.new
  end

  def generate_recipe
    recipe_name = fetch_recipe_name
    ai_ingredients = fetch_ingredients(recipe_name)
    ai_method = fetch_method(recipe_name, ai_ingredients)

    create_recipe(recipe_name, ai_ingredients, ai_method)
  end

  private

  def fetch_recipe_name
    prompt = if @recipe_type == "simple & sweet"
               "Give me one simple recipe name that can be made only with the ingredients #{@ingredients}. It should be easy to cook with minimal additional ingredients. Without any of your own answer like 'Here is a simple recipe.'"
             else
               "Give me one exotic and creative recipe name that can be made only with the ingredients #{@ingredients}. The recipe can contain additional interesting ingredients that complement the recipe. Without any of your own answer like 'Here is a simple recipe. Give me only the recipe name.'"
             end

    response = @client.chat(parameters: { model: "gpt-4o-mini", messages: [{ role: "user", content: prompt }] })
    response["choices"][0]["message"]["content"]
  end

  def fetch_ingredients(recipe_name)
    prompt = "Give me the ingredients and their quantities #{@ingredients} of a recipe for #{recipe_name}. Also, suggest any additional common or complementary ingredients that would improve or enhance the recipe. I want it in bullet form without any * around ingredients. Without any of your own answer like 'Here is a simple recipe.'"

    response = @client.chat(parameters: { model: "gpt-4o-mini", messages: [{ role: "user", content: prompt }] })
    response["choices"][0]["message"]["content"]
  end

  def fetch_method(recipe_name, ingredients)
    prompt = "Give me only the method of a recipe for #{recipe_name} using the ingredients and quantities of #{ingredients}. Without any of your own answer like 'Here is a simple recipe.'"

    response = @client.chat(parameters: { model: "gpt-4o-mini", messages: [{ role: "user", content: prompt }] })
    response["choices"][0]["message"]["content"]
  end

  def create_recipe(name, ingredients, method)
    recipe = Recipe.new(title: name, ingredients: ingredients, method: method)
    recipe.user = @user
    recipe.save!
    recipe
  end
end



