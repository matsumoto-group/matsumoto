class OrderAlbum < ApplicationRecord

  belongs_to :order

  attachment :jacket_image

end
