module Admin
  class CampaignsController < Manticore::ApplicationController
  
    def index
      @campaigns = Campaign.all
    end
    
    def new
      @campaign = Campaign.new
    end
    
    def create
      @campaign = Campaign.new(params[:campaign])
      if @campaign.save
        redirect_to admin_campaigns_path, :notice => "Campaign successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @campaign = Campaign.find(params[:id])
    end
    
    def update
      @campaign = Campaign.find(params[:id])
      if @campaign.update_attributes(params[:campaign])
        redirect_to admin_campaigns_path, :notice => "Campaign successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @campaign = Campaign.find(params[:id])
      @campaign.destroy
      redirect_to admin_campaigns_path, :notice => "Campaign destroyed."
    end
    
  end
end
