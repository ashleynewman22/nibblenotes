class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_categories
  has_many  :categories, :through => :recipe_categories
  has_many  :notes
  has_one_attached :photo

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :description, presence: true
end
