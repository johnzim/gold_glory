class AddTrueWeightColumnToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :true_weight, :integer
  end

  def self.down
    remove_column :athletes, :true_weight
  end
end
