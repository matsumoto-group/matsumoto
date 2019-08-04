class Customers::OrdersController < ApplicationController

	before_action :login_check, only: [:new, :confirm, :create]

	def new
		@order = Order.new
    @order.order_albums.build
		@customer = current_customer
		@cart_album = CartAlbum.where(customer_id:@customer.id)
	end

	def confirm
		@order = Order.new(order_params)
		@customer = current_customer
		@cart_album = CartAlbum.where(customer_id:@customer.id)
	end

	def create
		order = current_customer.orders.new(order_params)
    	order_album = order.order_albums.build
    	order.purchase_date = order.created_at
    	order.first_name_kana = current_customer.first_name_kana
    	order.last_name_kana = current_customer.last_name_kana
		cart_album = CartAlbum.where(customer_id: current_customer.id)
    	total = 0
    	cart_album.each do |c|
    		taxprice = c.album.price * 1.08
      		total += taxprice
    	end
		order.subtotal = total + 500

    	cart_album.each do |c|
     	order_album.album_name = c.album.album_name,
      	order_album.jacket_image = c.album.jacket_image,
      	order_album.price = c.album.price,
      	order_album.stock_quanitity = c.order_quantity,
      	order_album.genre = c.album.genre,
      	order_album.label = c.album.label
    end
		if order.save
      cart_album = cart_album.where(customer_id: current_customer.id)
      cart_album.each do |cart|
        cart.album.stock_quantity = cart.album.stock_quantity - cart.order_quantity
        cart.album.save
        cart.destroy
      end
    end

    binding.pry
		redirect_to customer_path(current_customer.id)
	end
	


	private

	def login_check
		unless customer_signed_in?
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end

	def order_params
    	params.require(:order).permit( :first_name, :last_name, :postalcode, :order_adress, :payway, :order_status, order_albums_attributes: [:id, :order_id, :album_name, :jacket_image, :price, :stock_quantity, :genre, :label])
  	end



end
