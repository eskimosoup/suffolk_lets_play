class AddCampaignIdToCompetitions < ActiveRecord::Migration
  def up
    add_column :competitions, :campaign_id, :integer
    change_column :competitions, :prize_name, :string
  end
  
  def down
    remove_column :competitions, :campaign_id, :integer
    change_column :competitions, :prize_name, :text
  end
end
