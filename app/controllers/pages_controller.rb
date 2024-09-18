class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def ai_answer
      service = AiRecipeService.new(
        ingredients: params[:recipe][:ingredients],
        recipe_type: params[:recipe][:recipe_type],
        user: current_user
      )

      recipe = service.generate_recipe

      if recipe
        redirect_to edit_recipe_path(recipe)
      else
        redirect_to recipes_path  # Handle error, e.g., render :new or redirect_to an error page
      end
  end
end
