class Customer::CustomersController < ApplicationController
  #ログインしていない場合にログインページにリダイレクトさせるヘルパーメソッド
  before_action :ensure_correct_customer, only: [:update]

  def show
    @customer = Customer.find(params[:id])
    @lists = @customer&.lists
    @list = List.new
  end

  def index
    @users = Customer.all
    @list = List.new
  end

  def edit
    @user = Customer.find(params[:id])
    if @customer.id != current_customer.id
    redirect_to customer_customer_path(current_user)
    end
  end

  def update
    if @user.update(customer_params)
      redirect_to customer_customer_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  #---フォロー機能のメソッド---
  def follows
    @user = Customer.find(params[:id])
    @users = customer.following_customer.page(params[:page]).per(3).reverse_order
  end

  def followers
    @user = Customer.find(params[:id])
    @users = customer.follower_customer.page(params[:page]).per(3).reverse_order
  end
  #---------------------------


  private
  #customerのparams設定
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end
  #ユーザーと投稿を紐付けるメソッド
  def ensure_correct_user
    @user = Customer.find(params[:id])
    unless @user == current_customer
      redirect_to customer_customer_path(current_user)
    end
  end
end

