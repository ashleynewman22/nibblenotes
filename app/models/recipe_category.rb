class RecipeCategory < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :recipe_id, uniqueness: true
end
