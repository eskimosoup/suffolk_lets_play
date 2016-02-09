class DropTables < ActiveRecord::Migration

  def change
    drop_table :foods
    drop_table :drinks
    drop_table :activities
  end

end
