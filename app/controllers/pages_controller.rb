class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def ai_answer
    @ingredients = params[:recipe][:ingredients]
    recipe_type = params[:recipe][:recipe_type]

    prompt = if recipe_type == "simple & sweet"
               "Give me one simple recipe name that can be made only with the ingredients #{@ingredients}. It should be easy to cook with minimal additional ingredients. Without any of your own answer like 'Here is a simple recipe."
             else
               "Give me one exotic and creative recipe name that can be made only with the ingredients #{@ingredients}. The recipe can contain additional interesting ingredients that complement the recipe. Without any of your own answer like 'Here is a simple recipe. Give me only the recipe name"
             end

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: prompt }]
    })
    @content = chatgpt_response["choices"][0]["message"]["content"]

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "Give me the ingredients and their quantities #{@ingredients} of a recipe for #{@content}.  Also, suggest any additional common or complementary ingredients that would improve or enhance the recipe. Without any of your own answer like 'Here is a simple recipe'."}]
    })
    @ai_ingredients = chatgpt_response["choices"][0]["message"]["content"]

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "Give me only the method of a recipe for #{@content} using the ingredients and quantities of #{@ai_ingredients}. Without any of your own answer like 'Here is a simple recipe'."}]
    })
    @ai_method = chatgpt_response["choices"][0]["message"]["content"]
    recipe = Recipe.new(title: @content, ingredients: @ai_ingredients, method: @ai_method)
    recipe.user = current_user
    if recipe.save!
      # redirect_to recipe_path(recipe)
      redirect_to edit_recipe_path(recipe)
    end
  end
end
