class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart
  # without this line, a nil passing to the new_order_path

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # only allow users to checkout, cannot see order details by enter /orders/4
  skip_before_action :authorize, only: [:create, :new]


  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    # @cart ---- since before_action set_cart sending the @cart obj back
    if @cart.line_items.empty?
        redirect_to shopper_url, notice: "your cart is empty"
        return
    end

    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    
   
    # for this @order, find all the line_items entity underthis cart, 
    # and made them belongs to the order table
    @order.add_items_from_cart(@cart)  #defined in /app/models/order.rb
    


    respond_to do |format|
      if @order.save
        #empty the cart once click the place order button
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil #clear the session

        #and want to see the shopper products list 
        format.html { redirect_to shopper_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :paytype)
    end

end
