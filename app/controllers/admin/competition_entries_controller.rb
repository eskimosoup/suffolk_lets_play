module Admin
  class CompetitionEntriesController < Manticore::ApplicationController
  
    def index
      if params[:competition_id]
        @competition_entries = CompetitionEntry.where(:competition_id => params[:competition_id])
      else
        @competition_entries = CompetitionEntry.all
      end
    end
    
    def edit
      @competition_entry = CompetitionEntry.find(params[:id])
    end
    
    def update
      @competition_entry = CompetitionEntry.find(params[:id])
      if @competition_entry.update_attributes(params[:competition_entry])
        redirect_to admin_competition_entries_path, :notice => "Competition entry successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @competition_entry = CompetitionEntry.find(params[:id])
      @competition_entry.destroy
      redirect_to admin_competition_entries_path, :notice => "Competition entry destroyed."
    end
    
  end
end
