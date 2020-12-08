class Publics::CardsController < ApplicationController
  def index
  	@cards = Card.all
  end
  # カード一覧

  def show
  	@card = Card.find(params[:id])
  end
  # カード詳細画面
  private
  def card_params
  	params.require(:card).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
end
