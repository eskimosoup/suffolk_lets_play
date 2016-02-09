class AddPositionToFoodCategories < ActiveRecord::Migration
  def change
    add_column :food_categories, :position, :integer
  end
end
