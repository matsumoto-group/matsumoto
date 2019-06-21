class Song < ApplicationRecord

  has_many :songs, dependent: :destroy

end
