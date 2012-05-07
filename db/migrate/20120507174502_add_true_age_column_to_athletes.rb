class AddTrueAgeColumnToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :true_age, :integer
  end

  def self.down
    remove_column :athletes, :true_age
  end
end
