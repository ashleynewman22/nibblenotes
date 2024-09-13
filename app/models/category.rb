class Category < ApplicationRecord
  belongs_to  :user
  has_one_attached :photo
  has_many  :recipe_categories
  has_many  :recipes, :through => :recipe_categories

  validates :name, presence: true
  validates :description, presence: true
end
