module Admin
  class GameCardsController < Manticore::ApplicationController
  
    def index
      @game_cards = GameCard.all
    end
    
    def new
      @game_card = GameCard.new
    end
    
    def create
      @game_card = GameCard.new(params[:game_card])
      if @game_card.save
        redirect_to admin_game_cards_path, :notice => "Game card successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @game_card = GameCard.find(params[:id])
    end
    
    def update
      @game_card = GameCard.find(params[:id])
      if @game_card.update_attributes(params[:game_card])
        redirect_to admin_game_cards_path, :notice => "Game card successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @game_card = GameCard.find(params[:id])
      @game_card.destroy
      redirect_to admin_game_cards_path, :notice => "Game card destroyed."
    end
    
    def bulk_upload
      @request = "#{request.protocol}#{request.host_with_port}"
      GameCard.upload_images(@request)
    	redirect_to admin_game_cards_path, :notice => "Bulk Upload Complete"
    end
    
  end
end
