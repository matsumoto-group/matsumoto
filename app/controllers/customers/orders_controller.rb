class Customers::OrdersController < ApplicationController

	before_action :login_check, only: [:new, :confirm, :create]

	def new
		@order = Order.new
		@customer = current_customer
	end

	def confirm
		@order = Order.new(order_params)

		if @order.valid?
			render :action => 'confirm'
		else
			render :action => 'new'
		end
	end

	def create
		@order = Order.new(order_params)
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
    	params.require(:order).permit(:first_name, :last_name, :postalcode, :order_adress, :payway)
  	end



end
