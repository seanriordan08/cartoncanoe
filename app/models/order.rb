class Order < ActiveRecord::Base
  attr_accessible :prefix, :first_name, :last_name, :address, :email, :phone_number,
	:date_of_delivery, :delivery_time, :pay_type, :city, :zip, :accept_terms
  PREFIX = ["Mrs.", "Miss ", "Ms.", "Mr."]
  PAYMENT_TYPES = ["Credit Card"]
  DELIVERY_LOCATIONS = ["Boulder", "Gunbarrel", "Longmont",  "Louisville", "Superior", "N/A"]
  
  has_many :line_items, :dependent => :destroy
  
  #Validations
  validates :first_name, :last_name, :address, :city, :zip, :email, 
	:phone_number, :date_of_delivery, :delivery_time, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :city, :inclusion => DELIVERY_LOCATIONS
  validates :zip, length: { is:5 }
  validates :accept_terms, :acceptance => true
  #End Validations
  
  def add_line_items_from_cart(cart)
	cart.line_items.each do |item|
		item.cart_id = nil
		line_items << item
	end
  end
  
end
