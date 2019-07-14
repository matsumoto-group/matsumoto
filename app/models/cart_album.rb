class CartAlbum < ApplicationRecord
	belongs_to :customer
	belongs_to :album
end
