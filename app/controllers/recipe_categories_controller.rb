class RecipeCategoriesController < ApplicationController
  before_action :set_recipe, only: [:index, :new, :create]

  def index
    @recipe_categories = @recipe.recipe_categories
  end

  def new
    @recipe_category = @recipe.recipe_categories.new
  end

  def create
    @recipe_category = @recipe.recipe_categories.new(recipe_category_params)
    if @recipe_category.save
      redirect_to recipe_recipe_categories_path(@recipe), notice: 'Category was successfully added to the recipe.'
    else
      render :new
    end
  end

  def destroy
    @recipe_category = RecipeCategory.find(params[:id])
    @recipe = @recipe_category.recipe
    @recipe_category.destroy
    redirect_to recipe_recipe_categories_path(@recipe), notice: 'Category was successfully removed from the recipe.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_category_params
    params.require(:recipe_category).permit(:category_id)
  end
end
