# class AiRecipeService
#   def initialize(ingredients)
#     @ingredients = ingredients
#     @client = OpenAI::Client.new
#   end

#   def fetch_recipe
#     name = fetch_recipe_name
#     ingredients = fetch_recipe_ingredients(name)
#     method = fetch_recipe_method(name, ingredients)
#     { name: name, ingredients: ingredients, method: method }
#   end

#   private

#   def fetch_recipe_name
#     response = @client.chat(parameters: {
#       model: "gpt-4o-mini",
#       messages: [{ role: "user", content: "Give me a name of a recipe with the ingredients #{@ingredients}. Without any of your own answer." }]
#     })
#     response["choices"][0]["message"]["content"]
#   end
#   def fetch_recipe_ingredients(name)
#     response = @client.chat(parameters: {
#       model: "gpt-4o-mini",
#       messages: [{ role: "user", content: "Give me the ingredients and quantities of a recipe with the name #{name}. Without any of your own answer." }]
#     })
#     response["choices"][0]["message"]["content"]
#   end
#   def fetch_recipe_method(name, ingredients)
#     response = @client.chat(parameters: {
#       model: "gpt-4o-mini",
#       messages: [{ role: "user", content: "Give me the method of a recipe with the name #{name} and the ingredients #{ingredients}. Without any of your own answer." }]
#     })
#     response["choices"][0]["message"]["content"]
#   end
# end
