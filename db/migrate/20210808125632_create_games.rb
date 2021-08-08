class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :image, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
