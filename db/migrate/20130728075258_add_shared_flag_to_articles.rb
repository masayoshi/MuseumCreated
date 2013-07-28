class AddSharedFlagToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :shared_flag, :boolean, :default => false
  end
end
