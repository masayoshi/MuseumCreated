class AddGenreIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :genre_id, :integer
  end
end
