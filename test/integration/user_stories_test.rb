require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures: products
  
  LineItem.delete_all
  Order.delete_all
  ruby_book = products(:ruby)
  
  get "/"
  assert_response :success
  assert_template "index"
  
  xml_http_request :post, '/line_items', :product_id => ruby_book.id
  assert_response :success
  
  cart = Cart.find(session[:cart_id])
  assert_equal 1, cart.line_items.size
  assert_equal ruby_book, cart.line_items[0].product
  
  get "/orders/new"
  assert_response :success
  assert_template "new"
  
  post_via_redirect "/orders",
					:order => { :name => "Sean Riordan",
								:address => "1214 E LN ST",
								:email => "sean.riordan08@gmail.com",
								:pay_type => "Check"}

  assert_response :success
  assert_template "index"
  cart = Cart.find(session[:cart_id])
  assert_equal 0, cart.line_items.size
  
  #Here we look into the database and make sure we've created an order with a line item
  orders = Order.all
  assert_equal 1, orders.size
  order = orders[0]
  
  assert_equal "Sean Riordan", 				order.name
  assert_equal "1216 W Denver", 			order.address
  assert_equal "sean.riordan08@gmail.com", 	order.email
  assert_equal "Check", 					order.pay_type
  
  assert_equal 1, order.line_items.size
  line_item = order.line_items[0]
  assert_equal ruby_book, line_item.product
  
  mail = ActionMailer::Base.deliveries.last
  assert_equal ["sean.riordan08@gmail.com"], mail.to
  assert_equal 'Sam Ruby <depot@example.com>', mail[:from].value
  assert_equal "Venuzip Confimation", mail.subject
  
end
