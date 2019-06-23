class Singer < ApplicationRecord

  has_many :album_singers, dependent: :destroy
  has_many :albums, through: :album_singers
  
end
