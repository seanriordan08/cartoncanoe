class AddUnitOfMeasureToProducts < ActiveRecord::Migration
  def change
    add_column :products, :unit_of_measure, :string
  end
end
