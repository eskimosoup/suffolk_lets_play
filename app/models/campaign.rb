class Campaign < ActiveRecord::Base
  
  has_many :competitions
  mount_uploader :logo, CampaignImageUploader
  
  validates :name, :slug, :presence => true  
end
