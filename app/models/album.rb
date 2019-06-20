class Album < ApplicationRecord

  has_many :discs, dependent: :destroy
  has_many :cart_albums, dependent: :destroy
end
