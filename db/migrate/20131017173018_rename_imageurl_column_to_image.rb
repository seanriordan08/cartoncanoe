class RenameImageurlColumnToImage < ActiveRecord::Migration
  def change
	rename_column :products, :image_url, :image
  end

end
