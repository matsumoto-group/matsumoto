class AlbumsController < ApplicationController
    
  def index
    @albums = Album.all
  end

  def new
    @post_album = Album.new
  end

  def create
    album = Album.new(album_params)
    album.save
    redirect_to root_path
  end

  private
  def album_params
    params.require(:album).permit(:album_name, :jacket_image, :price, :stock_quantity, :sales_status, :genre, :label)
  end

end
