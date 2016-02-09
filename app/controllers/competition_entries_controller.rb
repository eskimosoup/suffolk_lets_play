class CompetitionEntriesController < ApplicationController

  layout 'home'

  def new
    @competition = Competition.last
    @competition_entry = CompetitionEntry.new
  end

  def create
    @competition = Competition.last
    @competition_entry = CompetitionEntry.new(params[:competition_entry])
    if @competition_entry.save
      flash.now[:notice] = "Thanks for your entry"
      redirect_to root_path
    else
      render action: "new"
    end
  end

end

