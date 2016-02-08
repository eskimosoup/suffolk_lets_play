class CreateLeaderboardEntries < ActiveRecord::Migration
  def change
    create_table :leaderboard_entries do |t|
      t.string :nickname
      t.string :email
      t.integer :score
      t.string :location
      t.string :game
      t.string :competition

      t.timestamps
    end
  end
end
