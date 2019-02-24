class ChangeDefaultOfProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :favorites_count, :integer, default: 0
  end
end
