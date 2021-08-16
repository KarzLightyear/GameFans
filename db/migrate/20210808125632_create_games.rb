class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :genre_id
      t.integer :customer_id
      t.string :title
      t.text :body
      t.string :name
      t.string :image
      t.text :introduction

      t.timestamps
    end
  end
end
