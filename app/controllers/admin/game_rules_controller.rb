module Admin
  class GameRulesController < Manticore::ApplicationController
  
    def index
      @game_rules = GameRule.all
    end
    
    def new
      @game_rule = GameRule.new
    end
    
    def create
      @game_rule = GameRule.new(params[:game_rule])
      if @game_rule.save
        redirect_to admin_game_rules_path, :notice => "Game rule successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @game_rule = GameRule.find(params[:id])
    end
    
    def update
      @game_rule = GameRule.find(params[:id])
      if @game_rule.update_attributes(params[:game_rule])
        redirect_to admin_game_rules_path, :notice => "Game rule successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @game_rule = GameRule.find(params[:id])
      @game_rule.destroy
      redirect_to admin_game_rules_path, :notice => "Game rule destroyed."
    end
    
  end
end
