class CartCard < ApplicationRecord
	belongs_to :customer
	has_many :cards
end
