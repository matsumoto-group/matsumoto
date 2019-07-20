class OrderAlbumsController < ApplicationController
	def create
		@order_album = OrderAlbum.new

		@customer = current_customer
		@cart_album = CartAlbum.where(customer_id:@customer.id)

		@order_album.order_id = currentorder_albu.id
		@order_album.album_name = @cart_album.album_name
		@order_album.price = @cart_album.price

		@order_album.save
		redirect_to "/"
	end

	private
	def order_album_params
		params.require(:order_album).permit(:order_id, :album_name, :price)
	end
end
