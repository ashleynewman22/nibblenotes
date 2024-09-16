class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :recipe_categories
  has_many  :categories, :through => :recipe_categories
  has_many  :notes
  has_one_attached :photo

  validates :title, presence: true
  validates :ingredients, presence: true
  validates :description, presence: true

  # def content
  #   client = OpenAI::Client.new
  #   chatgpt_response = client.chat(parameters: {
  #     model: "gpt-4o-mini",
  #     messages: [{ role: "user", content: "Give me a simple recipe for #{name} with the ingredients #{ingredients}. Give me only the text of the recipe, without any of your own answer like 'Here is a simple recipe'."}]
  #   })
  #   return chatgpt_response["choices"][0]["message"]["content"]
  # end
end
