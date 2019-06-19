class CreateCartAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_albums do |t|
      t.integer :customer_id
      t.integer :album_id
      t.integer :order_quantity

      t.timestamps
    end
  end
end
