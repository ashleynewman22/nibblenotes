class AddVisibilityToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :visibility, :string, default: 'public'
  end
end
