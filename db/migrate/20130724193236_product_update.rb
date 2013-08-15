class ProductUpdate < ActiveRecord::Migration
  def change
	add_column :products, :brand, :string
	add_column :products, :portion_size, :decimal
	add_column :products, :priority, :string
  end
  
end
