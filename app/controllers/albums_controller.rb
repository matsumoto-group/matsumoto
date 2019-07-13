class AlbumsController < ApplicationController
    
  def index
      @albums = if params[:search]
      Album.page(params[:page]).reverse_order.search(params[:search])
      else 
        Album.page(params[:page]).reverse_order
      end
  end

  def show
    @album = Album.find(params[:id])      
  end
  

  def new
    @post_album = Album.new
    @post_album.singers.build
    @post_album.discs.build
    @post_album.discs.songs.build
    @post_album.cart_albums.build
  end


  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to admins_album_path(@album)
    else
      render :new
    end
  
end
  
  def edit
    @album = Album.find(params[:id])
    @disc = @album.discs.build
    @song = @disc.songs.build
    @singer = @album.singers.build
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:album_name, :jacket_image, :price, :stock_quantity, :sales_status, :genre, :label, singers_attributes: [:id, :singer_name, :_destroy], discs_attributes: [:id, :_destroy, songs_attributes: [:id, :song_title, :_destroy]])
  end
end
