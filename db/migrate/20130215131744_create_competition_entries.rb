class CreateCompetitionEntries < ActiveRecord::Migration
  def change
    create_table :competition_entries do |t|
      t.integer :competition_id
      t.text :answer
      t.string :name
      t.string :postcode
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
