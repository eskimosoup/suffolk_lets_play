class CampaignsController < ApplicationController

  def show
    @campaign = Campaign.find_by_slug(params[:id])
    render :layout => 'home'
  end

end
