class OrdersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  # GET /orders
  # GET /orders.json
  
  def index
  	currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@day0 = currentTime.strftime("%a, %b #{Time.zone.now.day.ordinalize}")
	@day1 = tomorrow.strftime("%a, %b #{tomorrow.day.ordinalize}")
	@day2 = dayAfter.strftime("%a, %b #{dayAfter.day.ordinalize}")
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
  
	@orders = Order.find(:all, :order => 'date_of_delivery')
    @orders = Order.paginate :page => params[:page], :order => 'created_at desc',
		:per_page => 25	

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  
  	currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@day0 = currentTime.strftime("%a, %b #{Time.zone.now.day.ordinalize}")
	@day1 = tomorrow.strftime("%a, %b #{tomorrow.day.ordinalize}")
	@day2 = dayAfter.strftime("%a, %b #{dayAfter.day.ordinalize}")
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
  
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
 
	@cart = current_cart
	currentTime = Time.zone.now
	tomorrow = Time.zone.today + 1.day
	dayAfter = Time.zone.today + 2.day
	@day0 = currentTime.strftime("%a, %b #{Time.zone.now.day.ordinalize}")
	@day1 = tomorrow.strftime("%a, %b #{tomorrow.day.ordinalize}")
	@day2 = dayAfter.strftime("%a, %b #{dayAfter.day.ordinalize}")
	@stickyDay1 = tomorrow.strftime("%a")
	@stickyDay2 = dayAfter.strftime("%a")
	
		if (Order.where(:date_of_delivery => @day0).count == 5 || Time.zone.now.hour > 12) && Order.where(:date_of_delivery => @day1).count == 5 && Order.where(:date_of_delivery => @day2).count == 5
			flash[:error] = "Sorry, today we're booked!"
			redirect_to store_index_url
			return
		elsif @cart.line_items.empty?
			flash[:error] = "Your Cart is Empty"
			redirect_to store_index_url
			return
		elsif @cart.total_price < 25.00
			flash[:alert] = "Minimum Order is $25"
			redirect_to store_index_url
			return
		else
			@order = Order.new
			respond_to do |format|
				format.js	{ render :js => "window.location = '/orders/new'"}
				format.html # new.html.erb
				format.json { render json: @order }
			end
		end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
	cart = current_cart
    @order = Order.new(params[:order])
	@order.add_line_items_from_cart(current_cart)
	@cartPrice = cart.total_price
	
    respond_to do |format|
      if @order.save
		Cart.destroy(session[:cart_id])
		session[:cart_id] = nil
		Notifier.order_received(@order, @cartPrice).deliver
		flash[:notice] = "Thank You for your order! We'll give you a call #{@order.date_of_delivery} for payment details"
        format.html { redirect_to(store_index_url) }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
  
  def ReciPower_Orders
	@product = Product.find(params[:id])
	@orders = Order.all

		respond_to do |format|
			format.atom
			format.xml {render :xml => @product, :xml => @orders}
		end
  end
  
end
