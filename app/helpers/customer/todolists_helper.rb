module Customer::TodolistsHelper
  def todolist_form_path(list)
    if list.new_record?
      customer_todolists_path
    else
      customer_todolist_path(list)
    end
  end
end
