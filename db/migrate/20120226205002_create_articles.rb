class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :summary

      t.timestamps
    end
  end
end
