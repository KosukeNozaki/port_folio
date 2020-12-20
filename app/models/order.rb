class Order < ApplicationRecord
		enum payment_method: { credit_card: 0, bank_transfer: 1 }
	belongs_to :customer, optional: true
	has_many :cards, dependent: :destroy
	has_many :order_items, dependent: :destroy
	validates :payment_method, inclusion: { in: Order.payment_methods.keys }
	# 関連知の値を検知しないことでorder.saveでerrorがでなくなる

	enum status: { "入金待ち": 0,  "発送準備中": 1, "発送済み": 2 }
	def total_price
	  total = 0
	  self.order_items.each do |order_item|
	     total += order_item.order_price * order_item.amount
	  end
	  total
    end
    def sub_total_price(order_item)
		order_item.order_price * order_item.amount
	end
end
