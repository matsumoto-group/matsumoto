class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :purchase_date
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :payway
      t.integer :subtotal
      t.string :order_status
      t.string :postalcode
      t.string :order_adress

      t.timestamps
    end
  end
end
