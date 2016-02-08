class Competition < ActiveRecord::Base
  
  mount_uploader :prize_image, PrizeImageUploader
  belongs_to :campaign
  has_many :competition_entries
  
  validates :name, :start_date, :end_date, :campaign_id, {:presence => true}
  validates :prize_name, {
    :presence => {:message => "can't be blank if you upload an image"}, 
    :if => Proc.new {|c| c.prize_image?}
  }
  
  scope :active, lambda { where("start_date <= ? AND end_date >= ?", Time.zone.now, Time.zone.now ) }
end
