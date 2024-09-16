class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.references :recipe, null: false, foreign_key: true
      t.timestamps

      def change
        add_reference :notes, :user, foreign_key: true
      end
      
    end
  end
end
