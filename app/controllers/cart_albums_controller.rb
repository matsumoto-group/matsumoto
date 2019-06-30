class CartAlbumsController < ApplicationController
    def create
        album = Album.find(params[:album_id])
        cart_album = current_customer.cart_albums.new(album_id: album.id)
        cart_album.save
        redirect_to customer_path(current_customer.id)
    end

    def destroy
        album = Album.find(params[:album_id])
        cart_album = current_customer.cart_albums.find_by(album_id: album.id)
        cart_album.destroy
        redirect_to customer_path(current_customer.id)
　  end
    

end
