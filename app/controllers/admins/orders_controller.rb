class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end
  # 注文一覧画面

  def show
  	@order = Order.find(params[:id])
  end
  # 注文詳細画面

  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
  end
  # 注文ステータス更新
  private
  def order_params
  	params.require(:order).permit(:cutstomer_id, :postal_code, :email, :address, :telephone_number, :order_price, :payment_method, :status, :postage)
  end
end
