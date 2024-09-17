class Category < ApplicationRecord
  belongs_to  :user
  has_one_attached :photo
  has_many  :recipe_categories
  has_many  :recipes, through: :recipe_categories

  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
