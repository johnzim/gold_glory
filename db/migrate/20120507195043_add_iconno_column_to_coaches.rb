class AddIconnoColumnToCoaches < ActiveRecord::Migration
  def self.up
    add_column :coaches, :iconno, :integer
  end

  def self.down
    remove_column :coaches, :iconno
  end
end
