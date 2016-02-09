class ChangeValueToCalories < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.rename :value, :calories
    end
    change_table :foods do |t|
      t.rename :value, :calories
    end
  end
end
