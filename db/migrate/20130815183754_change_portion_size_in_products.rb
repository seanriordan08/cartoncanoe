class ChangePortionSizeInProducts < ActiveRecord::Migration
  def up
	change_column :products, :portion_size, :decimal, :precision => 8, :scale => 2
  end

  def down
  end
end
