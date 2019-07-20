class Customers::OrdersController < ApplicationController

	before_action :login_check, only: [:new, :confirm, :create]

	def new
		@order = Order.new
		@customer = current_customer
		@cart_album = CartAlbum.where(customer_id:@customer.id)
	end

	def confirm
		@order = Order.new(order_params)
		@customer = current_customer
		@cart_album = CartAlbum.where(customer_id:@customer.id)
		if @order.valid?
			render :action => 'confirm'
		else
			render :action => 'new'
		end
	end

	def create
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		@order.save
		redirect_to complete_customers_orders_path
	end



	private

	def login_check
		unless customer_signed_in?
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end

	def order_params
    	params.require(:order).permit(:first_name, :last_name, :postalcode, :order_adress, :payway, :customer_id)
  	end



end
