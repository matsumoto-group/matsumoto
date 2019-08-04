class Disc < ApplicationRecord
  belongs_to :album
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs 
  accepts_nested_attributes_for :album_songs, allow_destroy: true
  accepts_nested_attributes_for :songs



end
