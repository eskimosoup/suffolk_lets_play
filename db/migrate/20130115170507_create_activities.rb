class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :front_image
      t.string :back_image
      t.integer :value
      t.boolean :display

      t.timestamps
    end
  end
end
