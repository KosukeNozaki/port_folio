class Publics::OrdersController < ApplicationController
  def new
    # 注文情報入力画面（支払方法・配送先の選択)
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer)
    # ログインしている顧客のidを取得
  end
  # クレジットカードor銀行振込入力画面
  def payment_screen
    @order = Order.new(order_params)
    @addresses = Address.where(customer_id: current_customer)
  end
    # 注文情報確認画面
  def confirm
    @cart_cards = current_customer.cart_cards
    @order = Order.new(order_params)
    if order_params[:payment_method] == 0 and order_params[:credit_number].blank?
      flash[:alert] = "未入力の項目があります。"
      render 'payment_screen'
      return
    end
    if order_params[:payment_method] == 0 and order_params[:card_name].blank?
      flash[:alert] = "未入力の項目があります。"
      render 'payment_screen'
      return
    end
    if order_params[:payment_method] == 0 and order_params[:security_code].blank?
      flash[:alert] = "未入力の項目があります。"
      render 'payment_screen'
      return
    end

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
    @customer = current_customer
    @orders = @customer.orders
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.postage = 200
    @order.save
      @cards = current_customer.cart_cards
      @cards.each do |card|
        @order_items = OrderItem.new
        @card = Card.find(card.card_id)
        @order_items.order_id = @order.id
        @order_items.order_price = @card.price
        @order_items.card_id = card.card_id
        @order_items.amount = card.amount
        @order_items.save
      end
      current_customer.cart_cards.destroy_all
      flash[:complete] = "ご注文ありがとうございました。"
      redirect_to root_path
  end
  # 注文履歴画面
  def index
    @orders = current_customer.orders
  end
  # 注文履歴詳細画面
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price = @order.order_price + @order.postage
  end
  private
  def order_params
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    # enumで数値型に変換するため
    params.require(:order).permit(:customer_id,:postal_code, :email, :address, :telephone_number, :order_price, :payment_method, :address_option, :status, :postage, :amount, :name, :card_id, :credit_number, :card_name, :security_code)
  end
end
