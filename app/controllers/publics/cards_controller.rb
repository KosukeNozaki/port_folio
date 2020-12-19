class Publics::CardsController < ApplicationController
  # カード一覧
  def index
  	@cards = Card.all
  end
  # カード詳細画面
  def show
  	@card = Card.find(params[:id])
    @cart_card = CartCard.new
  end
  # カードの検索
  def new
    @cards = Card.where('name LIKE ?', "%#{params[:name]}%")
    #@searches = Card.search(params[:search])
  end
  private
  def card_params
  	params.require(:card).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
end
