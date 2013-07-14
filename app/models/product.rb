﻿class Product < ActiveRecord::Base
	default_scope :order => 'title'
	has_many :line_items
	has_many :orders, :through => :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
  
#...

private
#Ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
	if line_items.empty?
		return true
	else
		errors.add(:base, 'Line Items present')
		return false
	end
end

  attr_accessible :description, :image_url, :price, :title, :unit_of_measure
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {:with => %r{\.(gif|jpg|png)$}i,
            :message => 'must be a URL for GIF, JPG or PNG image. (images/example.jpg)'}
  validates :unit_of_measure, :format => {:with => %r{(ea|EA|lb|LB|ml|bag|oz|OZ|pk|GAL|GR|yd|pt)$}i,
			:message => 'must be a recognized unit (list is too long to mention).'}
end
