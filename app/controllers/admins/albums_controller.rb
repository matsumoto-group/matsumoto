class Admins::AlbumsController < ApplicationController
  
  def index
    @albums = if params[:search]
      Album.page(params[:page]).reverse_order.search(params[:search])
      else 
        Album.page(params[:page]).reverse_order
      end
  end
  
  def show
    @album = Album.find(params[:id])
    @album_singers = @album.album_singers
    
  end
  
  def new
    @album = Album.new
    @disc = @album.discs.build
    @song = @disc.songs.build
    @singer = @album.singers.build
  end

  
  def edit
    @album = Album.find(params[:id])
    @disc = @album.discs.build
    @song = @disc.songs.build
    @singer = @album.singers.build
  end

  def create
    @album = Album.new(album_params)
    if @album.save
       redirect_to root_path
    else 
       render :action => "new"
    end
  end
  

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to root_path
    else
      render :action => "edit"  
    end
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
