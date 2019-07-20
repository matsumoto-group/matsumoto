class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && deleted.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_albums, dependent: :destroy
  has_many :order_albums, dependent: :destroy
  accepts_nested_attributes_for :cart_albums
  has_many :orders, through: :order_albums
end
