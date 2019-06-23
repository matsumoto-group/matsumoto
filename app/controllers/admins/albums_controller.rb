class Admins::AlbumsController < ApplicationController
  
  def show
  end

  def edit

  end

  def new
    @post_album = Album.new
    @disc = @post_album.discs.build
    @song = @disc.songs.build
    @singer = @post_album.singers.build
  end

  def create
    album = Album.new(album_params)
    album.save
    redirect_to root_path
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
