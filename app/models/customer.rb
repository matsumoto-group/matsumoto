class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && deleted.blank?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_albums, dependent: :destroy
  accepts_nested_attributes_for :cart_albums
  has_many :orders, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :adress, presence: true
  validates :phone, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
  
end
