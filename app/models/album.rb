class Album < ApplicationRecord
  # attachment
  attachment :jacket_image

  # association
  has_many :discs, inverse_of: :album 
  has_many :album_singers, inverse_of: :album
  has_many :singers, through: :album_singers
  has_many :cart_albums, dependent: :destroy

  # cocoon
  accepts_nested_attributes_for :discs , allow_destroy: true
  accepts_nested_attributes_for :album_singers, allow_destroy: true
  accepts_nested_attributes_for :singers
  accepts_nested_attributes_for :cart_albums
  
  validates :album_name, presence: true
  validates :jacket_image, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
  validates :sales_status, presence: true
  validates :genre, presence: true
  validates :jacket_image, presence: true
  validates :label, presence: true
  
  def self.search(search)
    if search
      where(["album_name LIKE ?", "%#{search}%"])
    else
      all
    end
  end
  
  
end
