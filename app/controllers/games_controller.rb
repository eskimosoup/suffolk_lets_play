class GamesController < ApplicationController

  before_filter :set_category, :check_schools_version, :except => [:index, :show]

  def index
  end

  def show
  end

  def menu
    @game_rules = GameRule.where("game = ?", @category).first
    if @category == 'drinks'
      @subcategories = ['calories', 'units']
    end
    render :layout => 'menu'
  end

  def play
    unless params[:subcategory].blank?
      @subcategory = params[:subcategory]
    else
      @subcategory = "calories"
    end
    @default_fact = GameRule.where("game = ?", @category).first.fact
    @game_cards = GameCard.where(:display => true, :game_category => @category).order("RAND()").limit(8)
    @units = @game_cards.map{|x| x.units}
    @calories = @game_cards.map{|x| x.calories}
    @names = @game_cards.map{|x| x.name}
    @facts = @game_cards.map{|x| x.fact}

    @current_game_instance = GameInstance.create
    cookies[:game_instance_auth_token] = @current_game_instance.auth_token

    render :layout => 'game'
  end

  def high_scores
    @leaderboard_entries = LeaderboardEntry.where("game = ?", @category).order("score DESC").limit(5)
    render :layout => 'winner'
  end

  def win
    if current_game_instance
      @current_game_instance.update_attribute(:updated_at, DateTime.now)
      score = 600000-((@current_game_instance.updated_at.to_f - @current_game_instance.created_at.to_f)*1000).to_i
      score = 0 if score < 0
      @leaderboard_entry = LeaderboardEntry.new(
        :game_instance_id => @current_game_instance.id, 
        :score => score,
        :location => ''
      )
    end
    render :layout => 'winner'
  end

  def submit_score
    @leaderboard_entry = LeaderboardEntry.new(params[:leaderboard_entry])
    @leaderboard_entry.game = @category
    @leaderboard_entries = LeaderboardEntry.where("game = ?", @category).order("score DESC").limit(5)

    if current_game_instance and (@current_game_instance == @leaderboard_entry.game_instance)
      if @leaderboard_entry.save
        render :layout => 'winner', :action => 'high_scores'
      else
        flash.now[:notice] = 'There was an error submitting your score.'
        render 'win', :layout => 'winner'
      end
    else
      flash.now[:notice] = 'Sorry but your game session has expired.'
      render 'win', :layout => 'winner'
    end
  end

  private

  def set_category
    @category = params[:category]
  end

  def check_schools_version
    redirect_to root_url, alert: "Not allowed" if subdomain != "games" && params[:category] == "drinks"
  end

end
