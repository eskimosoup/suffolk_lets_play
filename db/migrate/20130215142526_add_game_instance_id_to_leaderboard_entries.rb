class AddGameInstanceIdToLeaderboardEntries < ActiveRecord::Migration
  def change
    add_column :leaderboard_entries, :game_instance_id, :integer
  end
end
