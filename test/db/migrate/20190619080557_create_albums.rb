class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.string :jacket_image
      t.integer :price
      t.integer :stock_quantity
      t.string :sales_status
      t.string :genre
      t.string :label

      t.timestamps
    end
  end
end
