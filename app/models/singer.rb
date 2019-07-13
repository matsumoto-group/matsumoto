class Singer < ApplicationRecord

  has_many :album_singers, dependent: :destroy
  has_many :albums, through: :album_singers
  validates :singer_name, presence: true
end
