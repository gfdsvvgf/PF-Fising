class Customer::FavoritesController < ApplicationController
  def create
    @list = List.find(params[:todolist_id])
    favorite = current_customer.favorites.new(list_id: @list.id)
    favorite.save

  end

  def destroy
    @list = List.find(params[:todolist_id])
    favorite = current_customer.favorites.find_by(list_id: @list.id)
    favorite.destroy

  end
end
