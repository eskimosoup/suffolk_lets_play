class CreateGameInstances < ActiveRecord::Migration
  def change
    create_table :game_instances do |t|
      t.string :auth_token
      t.timestamps
    end
  end
end
