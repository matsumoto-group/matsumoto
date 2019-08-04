class CartAlbumsController < ApplicationController

    def create
      album = Album.find(params[:album_id])
      cart_album = current_customer.cart_albums.new(album_id: album.id)
      cart_album.save
      redirect_to customer_path(current_customer.id)
    end

    def update_all
        params.permit!
        params['cart'].keys.each do |id|
          @ca = CartAlbum.find(id.to_i)
          @ca.update_attributes(params['cart'][id])
        end
        redirect_to customer_path(current_customer.id)
        #cart_album = CartAlbum.where(album_id: params[:album_id])
        #cart_album.update(cart_album_params)
        #redirect_to customer_path(current_customer.id)
    end

    def destroy  
        album = Album.find(params[:album_id])
        cart_album = current_customer.cart_albums.find_by(album_id: album.id)
        cart_album.destroy
        redirect_to customer_path(current_customer.id)
    end
       
    private
    def cart_album_params
      params.require(:cart_album).permit(:id, :order_quantity, :customer_id, :album_id)
    end
  end


