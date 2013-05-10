class StoreController < ApplicationController
  def index
    @products = Product.all

	if session[:counter].nil?
		@visits = 1
	else
		visits = session[:visit]
		@visits = visits + 1
	end
  end
  
end
