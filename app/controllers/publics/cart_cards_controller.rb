class Publics::CartCardsController < ApplicationController
  def index
    @cart_cards = current_customer.cart_cards
  end
  # カート内にあるカード一覧画面（数量の変更・カート削除も含む）

  def update
    @cart_card = CartCard.find(params[:id])
    @cart_card.update(amount: params[:cart_card][:amount])
    # カート内のデータは数量しか変更しないためamountのみ
    redirect_to cart_cards_path
  end
  # カート内カードデータ更新

  def destroy
    @cart_card = CartCard.find(params[:id])
    @cart_card.destroy
    redirect_to cart_cards_path
  end
  # カート内カードのデータ削除（１商品）

  def all_destroy
    current_customer.cart_cards.destroy_all
    redirect_to cart_cards_path
  end
  # カート内カードのデータ削除（すべて）

  def create
    @cart_card = CartCard.new(cart_card_params)
    @cart_cards = current_customer.cart_cards
    if @cart_cards.find_by(card_id: @cart_card.card_id)
      @cart_card_update = @cart_cards.find_by(card_id: @cart_card.card_id)
      @cart_card_update.amount += @cart_card.amount
      @cart_card_update.save
    else
    @cart_card.save
    end
    redirect_to cart_cards_path
  end
  # カート内カードデータ追加
  private
  def cart_card_params
    params.require(:cart_card).permit(:card_id, :customer_id, :amount)
  end
end
