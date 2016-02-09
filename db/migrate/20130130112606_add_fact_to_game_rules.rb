class AddFactToGameRules < ActiveRecord::Migration
  def change
    add_column :game_rules, :fact, :string
  end
end
