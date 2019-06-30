class Order < ApplicationRecord
 
  has_many :order_albums, dependent: :destroy

end
