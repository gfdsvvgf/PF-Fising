class Customer::RelationshipsController < ApplicationController
  def followings
    @customer = Customer.find(params[:user_id])
  end
  
  def followers
    @customer = Customer.find(params[:user_id])
  end
  
  
  
      
  def create
    @user = User.find(params[:relationship][:follow_id])
    following = current_customer.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to customer_customers_path
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to customer_customers_path
    end
  end

  def destroy
    @customer = Customer.find(params[:relationship][:follow_id])
    following = current_customer.unfollow(@customer)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to customer_customers_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @customer
    end
  end

end
