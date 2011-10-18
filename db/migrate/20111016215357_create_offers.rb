class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :offerer_user_id
      t.integer :offered_user_id

      t.timestamps
    end

    add_index :offers, :offerer_user_id
    add_index :offers, :offered_user_id
  end
end
