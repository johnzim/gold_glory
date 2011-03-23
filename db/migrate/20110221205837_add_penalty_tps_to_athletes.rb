class AddPenaltyTpsToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :penalty_tps, :integer
  end

  def self.down
    remove_column :athletes, :penalty_tps
  end
end
