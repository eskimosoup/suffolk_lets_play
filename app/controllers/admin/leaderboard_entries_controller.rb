module Admin
  class LeaderboardEntriesController < Manticore::ApplicationController
  
    def index
      unless params[:game].blank?
        @leaderboard_entries = LeaderboardEntry.where("game = ?", params[:game])
      else
        @leaderboard_entries = LeaderboardEntry.all
      end
      @games = LeaderboardEntry::GAMES
    end
    
    def new
      @leaderboard_entry = LeaderboardEntry.new
    end
    
    def create
      @leaderboard_entry = LeaderboardEntry.new(params[:leaderboard_entry])
      if @leaderboard_entry.save
        redirect_to admin_leaderboard_entries_path, :notice => "Leaderboard entry successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @leaderboard_entry = LeaderboardEntry.find(params[:id])
    end
    
    def update
      @leaderboard_entry = LeaderboardEntry.find(params[:id])
      if @leaderboard_entry.update_attributes(params[:leaderboard_entry])
        redirect_to admin_leaderboard_entries_path, :notice => "Leaderboard entry successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @leaderboard_entry = LeaderboardEntry.find(params[:id])
      @leaderboard_entry.destroy
      redirect_to admin_leaderboard_entries_path, :notice => "Leaderboard entry destroyed."
    end
    
  end
end
