class Admins::CardsController < ApplicationController
  # 商品一覧
  def index
    @cards = Card.all
  end

  # 商品新規登録
  def new
    @card = Card.new
    @genres = Genre.all
  end

  def create
    @card = Card.new(card_params)
    @card.save
    redirect_to admins_cards_path
  end

  # 商品詳細画面
  def show
    @card = Card.find(params[:id])
  end

  # 商品編集画面
  def edit
    @card = Card.find(params[:id])
    @genres = Genre.all
  end
  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to admins_cards_path
  end

  # 商品情報更新
  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    redirect_to admins_cards_path
  end

  private
  def card_params
    params.require(:card).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end
end
