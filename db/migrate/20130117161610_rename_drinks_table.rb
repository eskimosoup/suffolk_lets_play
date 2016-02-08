class RenameDrinksTable < ActiveRecord::Migration

  def change
    rename_table :alcoholic_drinks, :drinks
  end

end
