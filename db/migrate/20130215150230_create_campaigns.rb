class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :slug
      t.string :logo

      t.timestamps
    end
  end
end
