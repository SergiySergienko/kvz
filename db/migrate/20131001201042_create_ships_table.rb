class CreateShipsTable < ActiveRecord::Migration

  def self.up
    create_table :ships do |t|
      t.integer :user_id
      t.string :ship_type
      t.string :state
      t.timestamps
    end
    add_index :ships, :user_id
    add_index :ships, :ship_type
  end

  def self.down
    drop_table :ships
  end

end
