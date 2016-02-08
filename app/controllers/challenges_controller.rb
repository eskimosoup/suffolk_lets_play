class ChallengesController < ApplicationController
  
  def new
		@challenge = Challenge.new({
      :score => params[:score],
      :url => "#{request.host_with_port}/games/pycr/#{params[:game]}"
    })
  end
  
  def create
		@challenge = Challenge.new(params[:challenge])
		if @challenge.valid?
      flash.now[:notice] = "Challenge Sent!"
      ChallengeMailer.challenge_friend(@challenge).deliver      
    end
		render :action => "new"
  end
  

end
