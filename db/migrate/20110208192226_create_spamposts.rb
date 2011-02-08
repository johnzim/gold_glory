class CreateSpamposts < ActiveRecord::Migration
  def self.up
    create_table :spamposts do |t|
      t.string :content
      t.string :user_id

      t.timestamps
    end
    add_index :spamposts, :user_id
  end

  def self.down
    drop_table :spamposts
  end
end
