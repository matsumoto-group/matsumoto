class Song < ApplicationRecord
  has_many :album_songs, dependent: :destroy
  has_many :discs, through: :album_songs
  validates :song_title, presence: true
  

end
