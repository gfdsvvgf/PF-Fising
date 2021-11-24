class HomesController < ApplicationController

  def top
    @lists = List.all
    @genres = Genre.all
  end

  def about
  end
  
  
  
  #------退会機能のメソッド------
  def unsubscribe
    @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
  #-----------------------------
end
