class AddGenderColumnToCoaches < ActiveRecord::Migration
  def self.up
    add_column :coaches, :gender, :string
  end

  def self.down
    remove_column :coaches, :gender
  end
end
