class Deafault < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :average_star, :integer, default: 0
  end
end
