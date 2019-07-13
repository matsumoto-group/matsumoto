class Album < ApplicationRecord
  # attachment
  attachment :jacket_image

  # association
  has_many :discs, inverse_of: :album 
  has_many :album_singers, inverse_of: :album
  has_many :singers, through: :album_singers
  has_many :cart_albums, dependent: :destroy

  # cocoon
  accepts_nested_attributes_for :discs , allow_destroy: true
  accepts_nested_attributes_for :album_singers, allow_destroy: true
  accepts_nested_attributes_for :singers
  accepts_nested_attributes_for :cart_albums
  
end
