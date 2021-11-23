class Customer::HomesController < ApplicationController
  def top
  end
  
  def about
  end  
  def unsubscribe
    @customer = Customer.find_by(id: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(id: params[:name])
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end
end
