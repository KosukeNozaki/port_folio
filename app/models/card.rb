class Card < ApplicationRecord
	attachment :image
	has_many :cart_cards, dependent: :destroy
	belongs_to :genre
	has_many :order_items
	belongs_to :search
	def tax_price
		price * 1.08
	end
	
	def self.search(search)
    	search ? where('name LIKE ?', "%#{search}%") : all
  	end
end
