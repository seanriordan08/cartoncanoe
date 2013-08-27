class OrdersController < ApplicationController
  skip_before_filter :authorize
  # GET /orders
  # GET /orders.json
  
  def index
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
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
	Time.zone = 'MST'
	@cart = current_cart
	currentTime = Time.zone.now
	tomorrow = currentTime.today + 1.day
	dayAfter = currentTime.today + 2.day
	@day0 = currentTime.strftime("%a, %b #{currentTime.day.ordinalize}")
	@day1 = tomorrow.strftime("%a, %b #{tomorrow.day.ordinalize}")
	@day2 = dayAfter.strftime("%a, %b #{dayAfter.day.ordinalize}")
	
		if Order.where(:date_of_delivery => @day0).count == 5 && Order.where(:date_of_delivery => @day1).count == 5 && Order.where(:date_of_delivery => @day2).count == 5
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
    @order = Order.new(params[:order])
	@order.add_line_items_from_cart(current_cart)
	
    respond_to do |format|
      if @order.save
		Cart.destroy(session[:cart_id])
		session[:cart_id] = nil
		#Notifier.order_shipped(@order).deliver
		flash[:notice] = 'Thank You for your order! You will be contacted shortly for payment details'
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
