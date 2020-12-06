class Card < ApplicationRecord
	attachment :image
	has_many :cart_cards, dependent: :destroy
	belongs_to :genre
end
