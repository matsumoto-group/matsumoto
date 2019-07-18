class OrderAlbumsController < ApplicationController

  def create
    order = Order.where(customer_id: current_customer.id).last
    # add cart_album status below
    cart_albums = CartAlbum.where(customer_id: current_customer.id)
    orders = {
      OrderAlbum.album_name = cart_album.album_name
      OrderAlbum.jacket_image = cart_album.jacket_image
      OrderAlbum.price = cart_album.price
      OrderAlbum.stock_quantity = cart_album.stock_quantity
      OrderAlbum.genre = cart_album.genre
      OrderAlbum.label = cart_album.label
    }
    order_album = OrderAlbum.new(orders)
    binding.pry
    order_album.save
    redirect_to complete_customers_orders_path
  end

end
