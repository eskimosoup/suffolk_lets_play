class CampaignImageUploader < Chronicler::ImageUploader

  version :show  do
    process :resize_to_fill => [300, 300]
  end 

end