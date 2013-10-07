class CreatePlanetsTable < ActiveRecord::Migration
  
  def self.up
    create_table :planets do |t|
      t.integer :user_id
      t.integer :left
      t.integer :right
      t.integer :sonar_system
      t.string :planet_type
      t.timestamps
    end
    add_index :planets, :user_id
  end

  def self.down
    drop_table :planets
  end

end
