class LeaderboardEntry < ActiveRecord::Base
  
  belongs_to :game_instance

  validates :game, :nickname, :email, :game_instance_id, {:presence => true}
  validates :game_instance_id, {:uniqueness => true}
   
  GAMES = [
    "foods",
    "drinks",
    "activities"
  ]
  
    def place
      leaderboard_entries = LeaderboardEntry.where("game = ?", self.game).order("score DESC").map{|x| x.id}
      place = leaderboard_entries.index(id) + 1
    end
end
