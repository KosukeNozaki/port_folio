class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_cards, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  def full_name
    self.last_name + self.first_name
  end
  def customer_info
    "〒#{self.postal_code}#{self.address}#{self.full_name}"
  end
  def total_price
    total = 0
    cart_cards.each do |cart_card|
    total += cart_card.sub_total_price
  end
    total
  end
	def active_for_authentication?
		super && (self.is_active == true)
	end
end
