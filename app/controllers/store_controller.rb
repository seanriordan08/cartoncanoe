class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
	@search = Product.search do
		fulltext params[:search]
	end
	@products = @search.results
	@cart = current_cart
  end
 
  def show 
  	@search = Product.search do
		fulltext params[:search]
		paginate :page => params[:page] || 1, :per_page => 30
	end
	@products = @search.results
	@cart = current_cart
  end
  
end
