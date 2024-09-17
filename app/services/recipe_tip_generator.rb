# app/services/recipe_tip_generator.rb
class RecipeTipGenerator
  def initialize(recipe)
    @recipe = recipe
  end

  def generate_tip
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{
        role: "user",
        content: "Give me a helpful tip for #{@recipe.title} with the ingredients #{@recipe.ingredients}. The method is #{@recipe.method}. Give me only the helpful tip for the recipe, without any of your own answer like 'Here is a simple helpful tip'."
      }]
    })
    response["choices"][0]["message"]["content"]
  end
end
