class GameCard < ActiveRecord::Base
  
  GAME_CATEGORIES = ['foods', 'activities', 'drinks']
  FOOD_CATEGORIES = ['breakfast', 'lunch', 'dinner']

  validates :front_image, :back_image, :name, {:presence => true}
  validates :calories, {:presence => true, :numericality => {:only_integer => true}}
  mount_uploader :front_image, CardImageUploader
  mount_uploader :back_image, CardImageUploader
  
  def units_float
    units ? units.to_f/100 : nil
  end

  def units_float=value
    self.units = (value.blank? ? nil : (value.to_d*100).to_i)
  end
  
  def self.upload_images(request_from)
  	require 'csv'    

    csv_text = File.read("#{Rails.root}/public/bulk_upload/bulk_upload.csv")
    csv = CSV.parse(csv_text, :headers => true)
    unless csv.blank?
      csv.each do |row|
        row = row.to_hash.with_indifferent_access
        
        game_card = GameCard.new
        game_card.name = row["name"]
        game_card.fact = row["fact"]
        game_card.calories = row["calories"]
        game_card.units_float = row["units"]
        game_card.game_category = row["game_category"]
        game_card.category = row["category"]
        game_card.remote_front_image_url = "#{request_from}/bulk_upload/#{row["front_image"]}"
        game_card.remote_back_image_url = "#{request_from}/bulk_upload/#{row["back_image"]}"
        game_card.display = row["display"]
        game_card.created_at = Time.now
        game_card.updated_at = Time.now
        game_card.save
        
        `rm #{Rails.root}/public/bulk_upload/"#{row["front_image"]}"`
        `rm #{Rails.root}/public/bulk_upload/"#{row["back_image"]}"`
      
      end
      column_names = csv[0].headers
      filename = "#{Rails.root}/public/bulk_upload/bulk_upload.csv"
      CSV.open(filename, 'w') do |csv|
        csv << column_names      
      end
    end
	end
  
end
