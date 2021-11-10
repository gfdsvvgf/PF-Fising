class Customer::TodolistsController < ApplicationController
  def new
    @list = List.new
  end
end
