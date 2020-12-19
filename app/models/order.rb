class Order < ApplicationRecord
	belongs_to :customer, optional: true
	has_many :cards, dependent: :destroy
	has_many :order_items, dependent: :destroy
	# 関連知の値を検知しないことでorder.saveでerrorがでなくなる
	enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
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
