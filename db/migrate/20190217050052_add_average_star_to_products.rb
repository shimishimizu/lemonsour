class AddAverageStarToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :average_star, :integer
  end
end
