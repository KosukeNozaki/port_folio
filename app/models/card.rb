class Card < ApplicationRecord
	validates :genre_id, presence: true
	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true
	attachment :image
	has_many :cart_cards, dependent: :destroy
	has_many :order_items
	belongs_to :genre
	belongs_to :search
	def tax_price
		price * 1.08
	end
	
	def self.search(search)
    	search ? where('name LIKE ?', "%#{search}%") : all
  	end
end
