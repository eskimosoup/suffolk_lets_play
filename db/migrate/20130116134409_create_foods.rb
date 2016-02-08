class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :front_image
      t.string :back_image
      t.integer :value
      t.string :category
      t.boolean :display

      t.timestamps
    end
  end
end
