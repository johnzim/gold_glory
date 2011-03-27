class AddIconnoToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :iconno, :int
  end

  def self.down
    remove_column :athletes, :iconno
  end
end
