class Admin::TodolistsController < ApplicationController
  #before_action :authenticate_admin!
  def index
     @lists = Todolists.all
     @lists = Todolists.page(params[:page]).reverse_order
  end
  
  def show
    @list = Todolist.find(params[:id])
    @genre = @list.genre

  end
  
  def new
     @list = Todolist.new
     @genres = Genre.all
  end
  
  def create
     @list = Todolist.new(list_params)
  if @list.save
     redirect_to admin_item_path(@item.id)
  else
      render :new
  end
  end
  
  def edit
     @list = Todolist.find(params[:id])
     @genres = Genre.all
  end
  
  def update
     @list = Todolist.find(params[:id])
  if @list.update(list_params)
     redirect_to admin_list_path(@list.id)
  else
      @genres = Genre.all
      render :edit
  end
  end
  
  def destroy
    @list = Todolist.find(params[:id])
    @list.destroy
    redirect_to admin_lists_path
  end

  private

  def item_params
    params.require(:list).permit(:name, :introduction, :image, :genre_id, :price, :is_active)
  end


  
end
