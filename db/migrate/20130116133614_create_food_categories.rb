class CreateFoodCategories < ActiveRecord::Migration
  def change
    create_table :food_categories do |t|
      t.string :name
      t.boolean :display

      t.timestamps
    end
  end
end
