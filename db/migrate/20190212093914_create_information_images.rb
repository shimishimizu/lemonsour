class CreateInformationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :information_images do |t|
      t.integer :information_id
      t.string :information_image_id

      t.timestamps
    end
  end
end
