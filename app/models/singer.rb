class Singer < ApplicationRecord

  has_many :album_singers, dependent: :destroy

end
