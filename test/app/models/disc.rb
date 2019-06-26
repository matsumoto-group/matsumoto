class Disc < ApplicationRecord

  belongs_to :album
  has_many :album_singers, dependent: :destroy
  has_many :album_songs, dependent: :destroy

end
