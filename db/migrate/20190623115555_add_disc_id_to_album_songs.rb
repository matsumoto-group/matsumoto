class AddDiscIdToAlbumSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :album_songs, :disc_id, :integer
  end
end
