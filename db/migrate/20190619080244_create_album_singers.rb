class CreateAlbumSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :album_singers do |t|
      t.integer :album_id
      t.integer :singer_id

      t.timestamps
    end
  end
end
