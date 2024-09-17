class Recipe < ApplicationRecord
  belongs_to :user

  has_many  :recipe_categories
  has_many  :categories, :through => :recipe_categories

  has_many  :notes
  has_one_attached :photo

  validates :title, presence: true
  validates :ingredients, presence: true

  validates :method, presence: true

  include PgSearch::Model
pg_search_scope :search_by_title_and_ingredients,
  against: [ :title, :ingredients ],
  using: {
    tsearch: { prefix: true } #
  }
end
