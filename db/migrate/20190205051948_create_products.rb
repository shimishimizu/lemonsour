class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :product_image_id
      t.string :product_name
      t.string :maker
      t.date :release_date
      t.string :degree
      t.text :nutrition

      t.timestamps
    end
  end
end
