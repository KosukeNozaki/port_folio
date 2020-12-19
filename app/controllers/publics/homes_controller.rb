class Publics::HomesController < ApplicationController
  def top
  	@cards = Card.all
  end
  # トップページ

  def about
  	@cards = Card.all
  end
  # アバウトページ
end
