# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.where(user: current_user)
    if params[:query].present?
      @categories = @categories.search_by_name_and_description(params[:query])
    end
  end

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.recipes.each do |recipe|
      recipe.categories.delete(@category)
    end
    @category.destroy
      redirect_to categories_url, status: :see_other
    # redirect_to categories_url, notice: 'Category was successfully destroyed.'
    # ADD THIS redirect_to categories_path, status: :see_other
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :photo)
  end
end
