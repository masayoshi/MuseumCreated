class AddIconServiceNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :icon_service_name, :string
  end
end
