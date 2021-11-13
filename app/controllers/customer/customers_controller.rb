class Customer::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:update]

  def show
    @user = Customer.find(params[:id])
    @lists = @list.books
    @list = List.new
  end

  def index
    @users = Customer.all
    @list = List.new
  end  

  def edit
    @user = Customer.find(params[:id])
    if @customer.id != current_customer.id
    redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(customer_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def follows
    @user = Customer.find(params[:id])
    @users = customer.following_customer.page(params[:page]).per(3).reverse_order
  end

  def followers
    @user = Customer.find(params[:id])
    @users = customer.follower_user.page(params[:page]).per(3).reverse_order
  end
  
  

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end

