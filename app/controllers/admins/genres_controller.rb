class Admins::GenresController < ApplicationController
   # ジャンル管理画面（一覧・追加も含む）
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
    # ジャンルデータ登録
  def create
    @genre = Genre.new(genre_params)
    @genre.save!
    redirect_to admins_genres_path
  end
    # ジャンル編集画面
  def edit
    @genre = Genre.find(params[:id])
  end
    # ジャンルデータ更新
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admins_genres_path
  end
  def destroy
   @genre = Genre.find(params[:id])
   @genre.destroy
    redirect_to admins_genres_path
  end
  private
  def genre_params
    params.require(:genre).permit(:id, :name)
  end
end
