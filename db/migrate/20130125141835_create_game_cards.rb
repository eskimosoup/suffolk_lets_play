class CreateGameCards < ActiveRecord::Migration
  def up
    create_table :game_cards do |t|
      t.string :name
      t.string :game_category
      t.string :category
      t.integer :units
      t.integer :calories
      t.text :fact
      t.string :front_image
      t.string :back_image
      t.boolean :display
      t.timestamps
    end
  end

  def down
    drop_table :game_cards
  end
end
