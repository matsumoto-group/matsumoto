class Customers::OrdersController < ApplicationController

	before_action :login_check, only: [:new, :create]

	def new
		@customer = current_customer
	end


	private

	def login_check
		unless customer_signed_in?
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end



end
