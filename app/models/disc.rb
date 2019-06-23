class Disc < ApplicationRecord

  belongs_to :album
  #has_many :album_singers, dependent: :destroy
  #has_many :singers, through: :album_singers
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs 
  #accepts_nested_attributes_for :album_singers , reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :album_songs , reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :songs , reject_if: :all_blank, allow_destroy: true
  
  
  


end
