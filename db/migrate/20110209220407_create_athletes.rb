class CreateAthletes < ActiveRecord::Migration
  def self.up
    create_table :athletes do |t|
      t.integer :id
      t.integer :user_id
      t.string :gender
      t.integer :age
      t.integer :height
      t.integer :weight
      t.integer :skill
      
      t.integer :power
      t.integer :speed
      t.integer :endurance
      t.integer :reflex
      t.integer :technique
      t.integer :mentality

      t.timestamps
    end
    add_index :athletes, :user_id

  end

  def self.down
    drop_table :athletes
  end
end
