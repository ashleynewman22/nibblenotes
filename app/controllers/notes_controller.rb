class NotesController < ApplicationController
  def index
    @notes = Note.where(user: current_user)
    @categories = Category.all
  end

  def show
    @note = Note.find(params[:id])
    @recipe = @note.recipe
    @notes = @recipe.notes
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @note = Note.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @note = Note.new(note_params)
    @note.recipe = @recipe
    @note.user = current_user

    if @note.save
      redirect_to recipe_path(@recipe), notice: 'Note was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
    @recipe = @note.recipe
  end

  def update
    @note = Note.find(params[:id])
    @recipe = @note.recipe
    if @note.update(note_params)
      redirect_to recipe_path(@recipe), notice: 'Note was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @recipe = @note.recipe
    @note.destroy
    redirect_to recipe_path(@recipe), status: :see_other, notice: 'Note was successfully deleted.'
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
