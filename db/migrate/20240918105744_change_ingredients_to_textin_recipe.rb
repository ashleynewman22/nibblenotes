class ChangeIngredientsToTextinRecipe < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :ingredients, :text
  end
end
