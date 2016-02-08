SuffolkLetsPlay::Application.routes.draw do

  namespace :admin do manticore_resources :campaigns end

  namespace :admin do
    manticore_resources :activities
    manticore_resources :drinks
    manticore_resources :competitions
    manticore_resources :competition_entries
    manticore_resources :foods
    manticore_resources :food_categories
    chronicler_resources :game_cards
    manticore_resources :game_rules
    manticore_resources :leaderboard_entries
  end

  resources :games, :only => [:index, :show]
  get "games/:id/:category" => "games#menu"
  get "games/:id/:category/high_scores" => "games#high_scores"
  get "games/:id/:category/play" => "games#play"
  get "games/:id/:category/win" => "games#win"
  post "games/:id/:category/submit_score" => "games#submit_score"

  resources :campaigns, :only => [:show]
  resources :challenges, :only => [:new, :create]
  resources :competition_entries, :only => [:new, :create]

  mount Manticore::Engine => "/admin"

  root :to => "games#show", :id => 'pycr'

end
