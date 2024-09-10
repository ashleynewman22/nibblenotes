class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
