class CreateCompetitionQuestions < ActiveRecord::Migration
  def change
    create_table :competition_questions do |t|
      t.integer :competition_id
      t.string :question

      t.timestamps
    end
  end
end
