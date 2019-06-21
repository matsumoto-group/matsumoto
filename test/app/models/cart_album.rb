class CartAlbum < ApplicationRecord

  belongs_to :album
  belongs_to :customer

end
