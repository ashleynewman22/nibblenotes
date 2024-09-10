class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_categories
  has_many  :categories
  has_many  :notes

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :description, presence: true
end
