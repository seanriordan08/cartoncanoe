class AddScaleavailabilityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :scalable, :integer
    add_column :products, :not_for_sale, :integer
  end
end
