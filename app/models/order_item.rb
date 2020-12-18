class OrderItem < ApplicationRecord
	belongs_to :card
	belongs_to :order
	def subtotal_price
		card.price * amount
		# 小計部分
		# 左辺部分でitemsテーブルの値段カラムを持ってくる、右辺でcart_itemの数量のカラムを持ってくる
	end
end