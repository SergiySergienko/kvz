class CreateUsersTable < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.timestamps

      t.boolean :is_active
      t.integer :level
    end
    add_index :users, :is_active
    execute "ALTER TABLE users INHERIT user_base"
  end

  def self.down
    drop_table :users
  end
end
