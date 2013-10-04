class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
  
  	currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@day0 = currentTime.strftime("%a, %b #{Time.zone.now.day.ordinalize}")
	@day1 = tomorrow.strftime("%a, %b #{tomorrow.day.ordinalize}")
	@day2 = dayAfter.strftime("%a, %b #{dayAfter.day.ordinalize}")
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
  
	@search = Product.search do
		fulltext params[:search]
		paginate :page => params[:page] || 1, :per_page => 30
	end
	@products = @search.results
	@cart = current_cart
  end
 
  def show
  
  	currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@day0 = currentTime.strftime("%a, %b #{Time.zone.now.day.ordinalize}")
	@day1 = tomorrow.strftime("%a, %b #{tomorrow.day.ordinalize}")
	@day2 = dayAfter.strftime("%a, %b #{dayAfter.day.ordinalize}")
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
  
  	@search = Product.search do
		fulltext params[:search]
		paginate :page => params[:page] || 1, :per_page => 30
	end
	@products = @search.results
	@cart = current_cart
  end
  
end
