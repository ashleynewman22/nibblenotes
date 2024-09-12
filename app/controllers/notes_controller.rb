class NotesController < ApplicationController
  # def index
  # @notes = Note.where(user: current_user)
  # @categories = Category.all

  # ADD IF YOU WANT ALL RECIPES TO SHOW ON RECIPE, NOT ONLY WHEN YOU CLICK ON VIEW NOTES
  # def index
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @notes = @recipe.notes
  # end

  # end

  def show
    @note = Note.find(params[:id])
    # @recipe = Recipe.find(params[:recipe_id])
    @recipe = @note.recipe
    @notes = @recipe.notes
  end

  def new
    @recipe = Recipe.find(params[:recipe_id]) # need to use simple_form_for for user to create
    @note = Note.new
    # @note = @recipe.notes.build
  end

  def create
    # @recipe = Recipe.find(params[:recipe_id])
    # @note = @recipe.notes.build(note_params)
    # @note.user = current_user
    # OR
    @recipe = Recipe.find(params[:recipe_id])
    @note = Note.new(note_params)
    @note.recipe = @recipe
    # @note.user = current_user

    if @note.save
      redirect_to recipe_path(@recipe)
      # redirect_to recipe_path(@recipe)
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

  def note_params
    params.require(:note).permit(:content)
  end
end
# :recipe_id
