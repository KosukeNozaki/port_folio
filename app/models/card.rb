class Card < ApplicationRecord
	attachment :image
	has_many :cart_cards, dependent: :destroy
	belongs_to :genre
	def tax_price
		price * 1.08
	end
end
