class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user: current_user)
    @categories = Category.all
    # @notes = Note.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @notes = @recipe.notes
    # @notes = Notes.all
  end

  def new
    @recipe = Recipe.new # need to use simple_form_for for user to create new item rental
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @recipe = Recipe.find(params[:id])

  #   @recipe.destroy
  #   redirect_to recipes_path, status: :see_other
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :photo, :ingredients, :description, category_ids: [])
  end
end
