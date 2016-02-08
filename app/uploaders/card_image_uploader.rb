class CardImageUploader < Chronicler::ImageUploader

  version :show  do
    process :resize_to_fill => [154, 217]
  end

  version :show_960  do
    process :resize_to_fill => [123, 174]
  end

end
