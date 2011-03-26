class AddFirstNameToAthletes < ActiveRecord::Migration
  def self.up
    add_column :athletes, :first_name, :string
  end

  def self.down
    remove_column :athletes, :first_name
  end
end
