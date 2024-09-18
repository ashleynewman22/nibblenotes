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
        content: "Give me a helpful tip for #{@recipe.title} with the ingredients #{@recipe.ingredients}. The method is #{@recipe.method}. These are the tips I have #{@recipe.notes}. Give me a tip that I don't already have."
      }]
    })
    response["choices"][0]["message"]["content"]
  end
end
