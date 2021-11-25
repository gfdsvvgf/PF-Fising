class Customer::SearchsController < ApplicationController
  def search
     @model = params["model"]
     @content = params["content"]
     @method = params["method"]
     @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'customer'
      if method == 'perfect'
        Customer.where(name: content)
      else
        Customer.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'list'
      if method == 'perfect'
        List.where(title: content)
      else
        List.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
