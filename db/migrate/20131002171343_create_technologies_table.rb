class CreateTechnologiesTable < ActiveRecord::Migration
  
  def self.up
    create_table :technologies do |t|
      t.integer :user_id
      t.string :technology_type
      t.timestamps
    end
    add_index :technologies, :user_id
  end

  def self.down
    drop_table :technologies
  end

end
