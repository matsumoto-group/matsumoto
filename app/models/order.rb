class Order < ApplicationRecord
  has_many :order_albums, dependent: :destroy
  belongs_to :customer

  validates :last_name, presence: true
  validates :first_name, presence: true
# validates :postalcode, presence: true
  validates :order_adress, presence: true
  validates_acceptance_of :confirming

  # cocoon
  accepts_nested_attributes_for :order_albums, allow_destroy: true

  after_validation :check_confirming

   def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
   end

end
