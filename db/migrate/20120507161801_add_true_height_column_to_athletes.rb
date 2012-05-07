class AddTrueHeightColumnToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :true_height, :integer
  end

  def self.down
    remove_column :athletes, :true_height
  end
end
