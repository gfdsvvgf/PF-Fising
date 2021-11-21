class Customer::TodolistsController < ApplicationController
  #ログインしていない場合にログインページにリダイレクトさせるヘルパーメソッド
  #before_action :authenticate_customer!
  def new
    @list = List.new
  end


  def index
    @lists = List.all
    @list = List.new
  end

  def edit
　  @list = List.find(params[:id])
　  if @list.user.id != current_customer.id
    redirect_to customer_todolists_path

  end

  def show
    @new_list = List.new
    @list = List.find(params[:id])
    @user = @list.customer
    @comment = PostComment.new
    @comments = @lists.post_comments
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
    @list.user_id = current_customer.id
    # データをデータベースに保存するため
    if @list.save
     redirect_to customer_todolist_path(@list.id), notice: "You have created list successfully."
    else
      @lists = List.all
      @user = current_customer
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
    params.require(:list).permit(:title, :body, :image_id)
  end

end
