class Order < ActiveRecord::Base
  attr_accessible :prefix, :first_name, :last_name, :address, :email, :phone_number,
	:date_of_delivery, :delivery_time, :pay_type
  PAYMENT_TYPES = ["Cash", "Credit Card", "Check"]
  
  has_many :line_items, :dependent => :destroy
  
  validates :first_name, :last_name, :address, :email, 
	:phone_number, :date_of_delivery, :delivery_time, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  
  def add_line_items_from_cart(cart)
	cart.line_items.each do |item|
		item.cart_id = nil
		line_items << item
	end
  end
  
end
