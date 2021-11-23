class Admin::TodolistsController < ApplicationController
  before_action :authenticate_admin!
  def index
     @lists = List.all
     @lists = List.page(params[:page]).reverse_order
  end

  def show
    @list = List.find(params[:id])
    @genre = @list.genre

  end

  def new
     @list = List.new
     @genres = Genre.all
  end

  def create
     @list = List.new(list_params)
  if @list.save
     redirect_to admin_todolists_path(@list.id)
  else
      render :new
  end
  end

  def edit
     @list = List.find(params[:id])
     @genres = Genre.all
  end

  def update
     @list = List.find(params[:id])
  if @list.update(list_params)
     redirect_to admin_todolists_path(@list.id)
  else
      @genres = Genre.all
      render :edit
  end
  end

  def destroy
    @list = L.find(params[:id])
    @list.destroy
    redirect_to admin_todolists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :introduction, :image, :genre_id, :is_active)
  end



end
