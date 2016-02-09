class DropCompetitionQuestions < ActiveRecord::Migration
  def up
    drop_table :competition_questions
  end

  def down
    create_table :competition_questions do |t|
      t.integer :competition_id
      t.string :question

      t.timestamps
    end
  end
end
