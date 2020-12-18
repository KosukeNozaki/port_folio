class Card < ApplicationRecord
	attachment :image
	has_many :cart_cards, dependent: :destroy
	belongs_to :genre
	belongs_to :order
	has_many :order_items
	def tax_price
		price * 1.08
	end
end
