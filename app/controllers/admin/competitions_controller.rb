module Admin
  class CompetitionsController < Manticore::ApplicationController
  
    def index
      @competitions = Competition.all
    end
    
    def new
      @competition = Competition.new
    end
    
    def create
      @competition = Competition.new(params[:competition])
      if @competition.save
        redirect_to admin_competitions_path, :notice => "Competition successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @competition = Competition.find(params[:id])
    end
    
    def update
      @competition = Competition.find(params[:id])
      if @competition.update_attributes(params[:competition])
        redirect_to admin_competitions_path, :notice => "Competition successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @competition = Competition.find(params[:id])
      @competition.destroy
      redirect_to admin_competitions_path, :notice => "Competition destroyed."
    end
    
  end
end
