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
    order.purchase_date = order.created_at
    order.first_name_kana = current_customer.first_name_kana
    order.last_name_kana = current_customer.last_name_kana
		cart_albums = CartAlbum.where(customer_id: current_customer.id)
    total = 0
    cart_albums.each do |c|
      total += c.album.price
    end
		order.subtotal = total
    orders = {
      OrderAlbum.album_name = cart_album.album_name
      OrderAlbum.jacket_image = cart_album.jacket_image
      OrderAlbum.price = cart_album.price
      OrderAlbum.stock_quantity = cart_album.stock_quantity
      OrderAlbum.genre = cart_album.genre
      OrderAlbum.label = cart_album.label
    }
    order_album = order.order_albums.new(orders)
		order.save
		redirect_to customer_path
	end



	private

	def login_check
		unless customer_signed_in?
			flash[:alert] = "ログインしてください"
			redirect_to root_path
		end
	end

	def order_params
    	params.require(:order).permit( :first_name, :last_name, :postalcode, :order_adress, :payway, order_albums_attributes: [:id, :order_id, :album_name, :jacket_image, :price, :stock_quantity, :genre, :label])
  	end



end
