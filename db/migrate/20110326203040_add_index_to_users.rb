class AddIndexToUsers < ActiveRecord::Migration
  def self.up
    add_index :athletes, :user_id
  end

  def self.down
  end
end
