class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :user_id
      t.string :information_title
      t.text :information_content

      t.timestamps
    end
  end
end
