class AddTpsToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :tps, :integer
  end

  def self.down
    remove_column :athletes, :tps
  end
end
