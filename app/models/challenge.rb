class Challenge

	include ActiveModel::Validations
	include ActiveModel::Conversion
  extend  ActiveModel::Naming
  
  attr_accessor :email, :name, :score, :url
  
  validates :name, :url, :email, {:presence => true}
  
  validates :email, { :email => true, :if => "!email.blank?"}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  	
  def persisted?
    false
  end
    
end
