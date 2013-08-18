class AddMoreColumsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :city, :string
	add_column :orders, :zip, :string
  end
end
