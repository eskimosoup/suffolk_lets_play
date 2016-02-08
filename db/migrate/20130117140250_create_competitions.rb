class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.text :message
      t.string :prize_name
      t.text :prize_description
      t.string :prize_image
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end 
  end
end
