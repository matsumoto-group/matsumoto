class AlbumsController < ApplicationController
    
  def index
    @albums = Album.all
    
    
  end
  def show
    @album = Album.find(params[:id])
   
      
  end
  

  def new
    @post_album = Album.new
    @post_album.singers.build
    @post_album.discs.build
    @post_album.discs.songs.build

  end

  def create
    @album = Album.new(album_params)
    @album.save
    redirect_to root_path
  
    
      
    end

  
   
    #album = Album.new(album_params)
   
    #params[:album][:discs_attributes].each do |key, value|
     
      #value[:songs_attributes].each do |key2, value2|
       #puts "value2"
     #end
 
     #end
     #params[:album][:singer_attributes].each do |key, value| 
    #3puts "value"
     #end
    #album.save

    #redirect_to root_path


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
