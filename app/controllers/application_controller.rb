class ApplicationController < ActionController::Base
  protect_from_forgery 
  before_filter :authorize
  before_filter :set_var
  helper :all # include all helpers, all the time
  config.encoding = "utf-8"
  
  helper_method :order_limit
  
  private

	def set_var
		@day0 = Time.now.strftime("%a, %b #{Time.now.day.ordinalize}")
		@day1 = 1.day.from_now.strftime("%a, %b #{1.day.from_now.day.ordinalize}")
		@day2 = 2.days.from_now.strftime("%a, %b #{2.days.from_now.day.ordinalize}")
	end
  
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
