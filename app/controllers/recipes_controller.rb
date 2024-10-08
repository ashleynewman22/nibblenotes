class RecipesController < ApplicationController
  # def index
  #   @recipes = Recipe.where(user: current_user)
  #   @categories = Category.all
  #   # @notes = Note.all
  # end

  def index
    @recipes = Recipe.where(user: current_user)

    if params[:query].present?
      @recipes = @recipes.search_by_title_and_ingredients(params[:query])
    end

    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      # @recipes = @recipes.where(category: @category)
      @recipes = @recipes.joins(:categories).where(categories: { id: @category.id })
    end
    # else
    #   @recipes = Recipe.all
    # end
  end

 # app/controllers/recipes_controller.rb
  def show
    @recipe = Recipe.find(params[:id])
    @notes = @recipe.notes
  end

  def new_ai_tip
    @recipe = Recipe.find(params[:recipe])
    @content = RecipeTipGenerator.new(@recipe).generate_tip
    @note = Note.new(recipe: @recipe, content: @content, user: current_user)
    @note.save!
    redirect_to recipe_path(@recipe)
  end

  def new
    @recipe = Recipe.new
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    # @recipe.update(recipe_params)
    # redirect_to recipe_path(@recipe)
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated'
    else
      render :edit
    end
  end
end

  # def destroy
  #   @recipe = Recipe.find(params[:id])

  #   @recipe.destroy
  #   redirect_to recipes_path, status: :see_other
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :photo, :ingredients, :method, category_ids: [])
  end
