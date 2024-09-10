class Category < ApplicationRecord
  belongs_to  :user
  has_many  :recipe_categories
  has_many  :recipes

  validates :name, presence: true
  validates :description, presence: true
end
