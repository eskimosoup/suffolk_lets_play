class PrizeImageUploader < Chronicler::ImageUploader

  version :show  do
    process :resize_to_fill => [300, 250]
  end 

end