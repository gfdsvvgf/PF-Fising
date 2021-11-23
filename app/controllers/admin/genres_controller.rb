class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end




  def index
    @genre = Genre.new
    @genres = Genre.all
  end


  def edit
    @genre = Genre.find(params[:id])

  end



  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.page(params[:page]).per(10)
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end


  def destroy
    @genre = Genre.find(params[:id])  # データ（レコード）を1件取得
    @genre.destroy  # データ（レコード）を削除
    redirect_to admin_genres_path  # 投稿一覧画面へリダイレクト
  end

  private

  def genre_params
    params.require(:genre).permit(:name)

  end
end
