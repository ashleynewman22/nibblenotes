class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :categories
  has_many :notes
  has_many :recipes, through: :notes

  # validates :username, presence:  true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
