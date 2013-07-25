class UpdateOrderPage < ActiveRecord::Migration
  def change
	rename_column :orders, :name, :first_name
	add_column :orders, :prefix, :string
	add_column :orders, :last_name, :string
	add_column :orders, :date_of_delivery, :string
	add_column :orders, :delivery_time, :string
  end
end
