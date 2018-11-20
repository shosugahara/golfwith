class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.string :image
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :headcount

      t.timestamps
    end
  end
end
