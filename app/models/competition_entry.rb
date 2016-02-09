class CompetitionEntry < ActiveRecord::Base
  
  belongs_to :competition
  validates :name, :postcode, :answer, :competition_id, :presence => true
  
  validates :phone, {
    :presence => {:message => "can't be blank if you do not specify a valid email address"}, 
    :if => Proc.new {|c| c.email.blank?}
  }
  validates :email, {
    :presence => {:message => "can't be blank if you do not specify a telephone number"}, 
    :if => Proc.new {|c| c.phone.blank?}, 
    :email => true
  }
end
