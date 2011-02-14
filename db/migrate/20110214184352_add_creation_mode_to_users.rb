class AddCreationModeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :creation_mode, :boolean
  end

  def self.down
    remove_column :users, :creation_mode
  end
end
