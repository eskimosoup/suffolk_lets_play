class GameRule < ActiveRecord::Base
  
  validates :game, {:uniqueness => true}
  validates :game, :rules, :fact, {:presence => true}
   
  GAMES = [
    ["Play your cards right - foods", "foods"],
    ["Play your cards right - drinks", "drinks"],
    ["Play your cards right - activities", "activities"]
  ]
end