class CreateCartAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_albums do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :album_id
      t.integer :order_quantity, :default => 1
    end
  end
end
