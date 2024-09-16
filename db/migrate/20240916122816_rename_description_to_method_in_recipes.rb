class RenameDescriptionToMethodInRecipes < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipes, :description, :method
  end
end
