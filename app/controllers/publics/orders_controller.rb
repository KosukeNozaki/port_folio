class Publics::OrdersController < ApplicationController
  def new
    # 注文情報入力画面（支払方法・配送先の選択)
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer)
    # ログインしている顧客のidを取得
  end
    # 注文情報確認画面
  def confirm
    @cart_cards = current_customer.cart_cards
    @order = Order.new(order_params)
    @order.postage = 200
    if params[:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:address_option] == "1"
      @address = Address.find(params[:order][:delivery])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end
  # 注文完了画面
  def thanks
  end
  # 注文確定処理
  def create
    @order = Order.new
    @order.customer_id = params[:order][:customer_id]
    @order.id = params[:order][:order_id]
    @order.name = params[:order][:name]
    @order.postal_code = params[:order][:postal_code]
    @order.email = params[:order][:email]
    @order.address = params[:order][:address]
    @order.telephone_number = params[:order][:telephone_number]
    @order.status = 0
    @order.postage = 200
    @order.save!
    current_customer.cart_cards.destroy_all
    redirect_to root_path
  end
  # 注文履歴画面
  def index
    @orders = current_customer.orders
  end
  # 注文履歴詳細画面
  def show
    @order = Order.find(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :email, :address, :telephone_number, :order_price, :paymentt_method, :status, :postage)
  end
end
