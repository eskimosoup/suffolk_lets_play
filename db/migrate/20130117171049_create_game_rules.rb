class CreateGameRules < ActiveRecord::Migration
  def change
    create_table :game_rules do |t|
      
      t.string :game
      t.text :rules
      
      t.timestamps
    end 
  end
end
