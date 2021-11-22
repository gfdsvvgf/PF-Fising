class AddCustomerIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :customer_id, :integer
  end
end
