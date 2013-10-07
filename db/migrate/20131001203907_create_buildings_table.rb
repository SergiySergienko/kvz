class CreateBuildingsTable < ActiveRecord::Migration

  def self.up
    create_table :buildings do |t|
      t.integer :user_id
      t.integer :planet_id
      t.string :building_type
      t.timestamps
    end
    add_index :buildings, [:user_id, :planet_id]
  end

  def self.down
    drop_table :buildings
  end

end
