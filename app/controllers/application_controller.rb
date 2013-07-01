class ApplicationController < ActionController::Base
  before_filter :authorize
  helper :all # include all helpers, all the time
  protect_from_forgery
  config.encoding = "utf-8"
  
  private
  
	def current_cart
		GC.start
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
	
  protected
	
	def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, :notice => "Please Login"
		end
	end
	
end
