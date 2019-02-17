class ChangeFloat < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :average_star, :float, default: 0
  end
end
