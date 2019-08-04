class AddColumnToOrderAlbums < ActiveRecord::Migration[5.2]
  remove_column :order_albums, :jacket_image, :string
  add_column :order_albums, :jacket_image_id, :string
end
