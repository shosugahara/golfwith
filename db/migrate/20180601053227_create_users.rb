class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name

      # t.string :license_num
      # t.string :license_image

      t.string :level
      t.string :image_name



      t.timestamps
    end
  end
end
