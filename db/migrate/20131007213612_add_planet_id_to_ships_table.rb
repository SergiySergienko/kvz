class AddPlanetIdToShipsTable < ActiveRecord::Migration

  def self.up
    add_column :ships, :planet_id, :integer
    add_index :ships, :planet_id
  end

  def self.down
    remove_column :ships, :planet_id
  end

end
