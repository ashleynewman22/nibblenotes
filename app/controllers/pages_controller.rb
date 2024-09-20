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

  def explore
    @allrecipes = Recipe.where.not(user: current_user)
    if params[:query].present?
      @allrecipes = @allrecipes.search_by_title_and_ingredients(params[:query])
    end
  end
end
