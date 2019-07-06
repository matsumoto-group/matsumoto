class AddFirstNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :postalcode, :string
    add_column :customers, :adress, :string
    add_column :customers, :phone, :string
    add_column :customers, :deleted, :boolean
    add_column :customers, :sign_in_count, :integer
    add_column :customers, :current_sign_in_at, :datetime
    add_column :customers, :last_sign_in_at, :datetime
    add_column :customers, :current_sign_in_ip, :string
    add_column :customers, :last_sign_in_ip, :string

  end
end
