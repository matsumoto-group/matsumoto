class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_albums, dependent: :destroy
  has_many :order_albums, dependent: :destroy

  accepts_nested_attributes_for :cart_albums

end
