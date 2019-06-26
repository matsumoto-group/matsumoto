class AlbumSong < ApplicationRecord

  belongs_to :disc
  belongs_to :song

end
