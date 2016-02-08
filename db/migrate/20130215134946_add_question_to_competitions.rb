class AddQuestionToCompetitions < ActiveRecord::Migration
  def up
    add_column :competitions, :question, :string
  end
end
