class AddJacketImageIdToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :jacket_image_id, :string
  end
end
