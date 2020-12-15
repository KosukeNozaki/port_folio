class Order < ApplicationRecord
	belongs_to :customer, optional: true
	# 関連知の値を検知しないことでorder.saveでerrorがでなくなる
	enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
	enum status: { "入金待ち": 0,  "発送準備中": 1, "発送済み": 2 }
end
