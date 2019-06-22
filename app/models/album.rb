class Album < ApplicationRecord

  attachment :jacket_image
  has_many :discs, dependent: :destroy
  has_many :cart_albums, dependent: :destroy

  attachment :jacket_image

end
