class Customer::TodolistsController < ApplicationController
  #ログインしていない場合にログインページにリダイレクトさせるヘルパーメソッド
  before_action :authenticate_customer!

  def index
    @lists = List.all
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
    pp current_customer
    pp @list
    if @list.customer.id != current_customer.id
      redirect_to customer_todolists_path
    end
  end

  def show
    @new_list = List.new
    @list = List.find(params[:id])
    @customer = @list.customer
    @comment = PostComment.new
    @comments = @list.post_comments
  end




  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to customer_todolist_path(@list), notice: "You have updated list successfully."
    else
      render "edit"
    end

  end


  def create
    # データを新規登録
    @list = List.new(list_params)
    @list.customer_id = current_customer.id
    # データをデータベースに保存するため

    if @list.save!
     redirect_to customer_todolist_path(@list.id), notice: "You have created list successfully."
    else
      @lists = List.all
      @customer = current_customer
      render 'index'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to customer_todolists_path
  end


  private
  # ストロングパラメータの設定
  def list_params
    params.require(:list).permit(:title, :body, :image_id,:genre_id)
  end

end
