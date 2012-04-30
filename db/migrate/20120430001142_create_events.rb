class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :description
      t.string :url
      t.string :fee
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :user_id

      t.timestamps
    end
  end
end
