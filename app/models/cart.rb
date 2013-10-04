class Cart < ActiveRecord::Base
  #attr_accessible :quantity
  has_many :line_items, :dependent => :destroy

 def add_product(product_id, qty_selected)
	current_qty = qty_selected || 1
	
	current_item = line_items.find_by_product_id(product_id)	
	if current_item
		current_item.quantity += current_qty.to_i
	else
		current_item = line_items.build(:product_id => product_id)
		if qty_selected
			current_item.quantity += current_qty.to_i - 1 #removes unnecessary default value of 1
		end
	end
	
	current_item
 end
 
 def decrement_line_item_quantity(line_item_id)
	current_item = line_items.find(line_item_id)
	if current_item.quantity > 1
	  current_item.quantity -= 1
	else
	  current_item.destroy
	end
	current_item
 end
 
 def total_price
   line_items.to_a.sum { |item| item.total_price }
 end
  
 def total_items
   line_items.sum(:quantity)
 end
 
end