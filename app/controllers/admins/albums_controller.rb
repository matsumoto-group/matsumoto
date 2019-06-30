class Admins::AlbumsController < ApplicationController
  
  def index
    @albums = Album.all
    
  end
  
  def show
    @album = Album.find(params[:id])
    @album_singers = @album.album_singers
    
  end
  
  def new
    @post_album = Album.new
    @disc = @post_album.discs.build
    @song = @disc.songs.build
    @singer = @post_album.singers.build
  end
  
  def edit
    @album = Album.find(params[:id])
  end

  def create
    
  end
  

  def update
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admins_albums_url
  end

  private
  def album_params
    params.require(:album).permit(:album_name, :jacket_image, :price, :stock_quantity, :sales_status, :genre, :label,
                                  singers_attributes: [:id, :singer_name, :_destroy],
                                  discs_attributes: [:id, :_destroy,
                                                    songs_attributes: [:id, :song_title, :_destroy]
                                                    ]
                                  )
  end



end
