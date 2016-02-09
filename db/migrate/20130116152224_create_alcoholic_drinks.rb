class CreateAlcoholicDrinks < ActiveRecord::Migration
  def change
    create_table :alcoholic_drinks do |t|
      t.string :name
      t.string :front_image
      t.string :back_image
      t.integer :calories
      t.integer :units
      t.string :equivalent_to
      t.boolean :display

      t.timestamps
    end
  end
end
