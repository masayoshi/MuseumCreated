class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :url
      t.string :summary
      t.text :description
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
