class AdminController < ApplicationController
  def index
    @currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
  
	@total_orders = Order.count
  end
end