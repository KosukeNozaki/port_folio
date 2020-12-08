class Publics::CartCardsController < ApplicationController
  def index
  end
  # カート内にあるカード一覧画面（数量の変更・カート削除も含む）

  def update
  end
  # カート内カードデータ更新

  def destroy
  end
  # カート内カードのデータ削除（１商品）

  def all_destroy
  end
  # カート内カードのデータ削除（すべて）

  def create
  end
  # カート内カードデータ追加
  private
  def card_card_params
    params.require(:cart_card).permit(:card_id, :customer_id, :amount)
  end
end
