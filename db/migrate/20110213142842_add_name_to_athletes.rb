class AddNameToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :name, :string
  end

  def self.down
    remove_column :athletes, :name
  end
end
