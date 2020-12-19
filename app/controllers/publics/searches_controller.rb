class Publics::SearchesController < ApplicationController
  def index
  	@searches = Search.all.search(params[:search])
  end
end
