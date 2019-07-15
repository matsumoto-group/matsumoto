class DropTableCartalbums < ActiveRecord::Migration[5.2]
  def change
  	drop_table :cart_albums
  end
end
