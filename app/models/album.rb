class Album < ApplicationRecord
  attachment :jacket_image
  has_many :discs, inverse_of: :album 
  accepts_nested_attributes_for :discs , allow_destroy: true
  has_many :album_singers, inverse_of: :album
  has_many :singers, through: :album_singers
  accepts_nested_attributes_for :album_singers, allow_destroy: true
  accepts_nested_attributes_for :singers
  has_many :cart_albums, dependent: :destroy
  attachment :jacket_image
  
end
