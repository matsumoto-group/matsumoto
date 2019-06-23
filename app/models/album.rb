class Album < ApplicationRecord
  
  attachment :jacket_image
  has_many :discs, inverse_of: :album 
  has_many :album_singers, inverse_of: :album
  has_many :singers, through: :album_singers
  has_many :cart_albums, dependent: :destroy
  accepts_nested_attributes_for :singers , reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :discs , reject_if: :all_blank, allow_destroy: true
end
