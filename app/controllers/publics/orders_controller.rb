class Publics::OrdersController < ApplicationController
  def new
    order = Order.new
  end
  # 注文情報入力画面（支払方法・配送先の選択）

  def confirm
  end
  # 注文情報確認画面
  def thanks
  end
  # 注文完了画面

  def create
  end
  # 注文確定処理

  def index
  end
  # 注文履歴画面

  def show
    @order = Order.find(params[:id])
  end
  # 注文履歴詳細画面
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :email, :address, :telephone_number, :order_price, :paymentt_method, :status, :postage)
end
