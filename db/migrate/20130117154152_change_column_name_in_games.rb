class ChangeColumnNameInGames < ActiveRecord::Migration

  def change
    rename_column :activities, :equivalent_to, :fact
    rename_column :foods, :equivalent_to, :fact
    rename_column :alcoholic_drinks, :equivalent_to, :fact
  end

end
