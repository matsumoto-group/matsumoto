class AddColumnToAlbums < ActiveRecord::Migration[5.2]
  remove_column :albums, :jacket_image, :string
end
