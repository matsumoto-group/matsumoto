class AddOrderStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_status, :string, :default => "未配達"
  end
end
