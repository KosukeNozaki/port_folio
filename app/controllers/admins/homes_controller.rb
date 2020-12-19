class Admins::HomesController < ApplicationController
	def top
		@cards = Card.all.last(4)
	end
	# 管理者トップページ
end
