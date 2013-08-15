class AddUpcInProducts < ActiveRecord::Migration
  def up
	add_column :products, :upc, :integer, :precision => 11
  end

  def down
  end
end
