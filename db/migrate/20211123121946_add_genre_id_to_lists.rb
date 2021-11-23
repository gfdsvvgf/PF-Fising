class AddGenreIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :genre_id, :integer
  end
end
