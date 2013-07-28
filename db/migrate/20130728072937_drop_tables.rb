class DropTables < ActiveRecord::Migration
  def up
    drop_table :events
    drop_table :locations
    drop_table :services
    drop_table :comments
    drop_table :projects_users
    drop_table :projects
    drop_table :offers
    drop_table :feeds
    drop_table :works
    drop_table :taggings
    drop_table :tags
    drop_table :genres
    drop_table :users
  end

  def down
    raise ActiveRecord::IrreversibleMigrationn
  end
end
