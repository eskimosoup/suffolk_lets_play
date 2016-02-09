class AddEquivalenceToFoodsAndActivities < ActiveRecord::Migration
  def change
    add_column :foods, :equivalent_to, :string
    add_column :activities, :equivalent_to, :string
  end
end
