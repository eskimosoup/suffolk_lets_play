class GameInstance < ActiveRecord::Base

  has_many :leaderboard_entries

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.base64.tr('+/', '-_').tr('=', '')
    end while GameInstance.exists?(column => self[column])
  end

end
