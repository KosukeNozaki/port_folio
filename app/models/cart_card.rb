class CartCard < ApplicationRecord
	belongs_to :customer
	belongs_to :card
	def sub_total_price
		amount * card.price
	end

end
