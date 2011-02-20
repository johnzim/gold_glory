class AddTpTotalToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tp_total, :integer
  end

  def self.down
    remove_column :users, :tp_total
  end
end
