class DropTable < ActiveRecord::Migration

  def change
    drop_table :food_categories
  end

end
