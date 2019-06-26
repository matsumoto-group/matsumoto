class CreateOrderAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :order_albums do |t|
      t.integer :order_id
      t.string :album_name
      t.string :jacket_image
      t.integer :price
      t.integer :stock_quanitity
      t.string :genre
      t.string :label

      t.timestamps
    end
  end
end
