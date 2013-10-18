class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	default_scope :order => 'title'
	has_many :line_items
	has_many :orders, :through => :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	attr_accessible :description, :image, :price, :title, :unit_of_measure, :portion_size, :brand, :priority, :scalable, :not_for_sale

	validates :title, :description, :image, :unit_of_measure, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :portion_size, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true

	validates :image, :format => {:with => %r{\.(gif|jpg|png)$}i,
			:message => 'must be a URL for GIF, JPG or PNG image. (images/example.jpg)'}

	validates :unit_of_measure, :format => {:with => %r{(ea|EA|lb|LB|ml|bag|oz|OZ|pk|gal|GAL|GR|yd|pt|n/a|un|bag|Liter)$}i,
			:message => 'must be a recognized unit (list is too long to mention).'}
	
	
	
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
			
	searchable do
		text :brand, :description
	end
	
end
