class AlbumSinger < ApplicationRecord

  belongs_to :discs
  belongs_to :singers
 
end
