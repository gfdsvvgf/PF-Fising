class Customer::TodolistsController < ApplicationController
  def new
    @list = List.new
  end
  
  
  def index
    @lists = List.all
    
  end
  
  
  def show
    @list = List.find(params[:id])
    
  end  
  
  def create
    # データを新規登録
    list = List.new(list_params)
    # データをデータベースに保存するため
    list.save
    
    
  end
  
  private
  # ストロングパラメータの設定
  def list_params
    params.require(:list).permit(:title, :body, :image_id)
  end  
  
end
