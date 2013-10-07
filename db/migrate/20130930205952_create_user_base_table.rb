class CreateUserBaseTable < ActiveRecord::Migration

  def self.up
    create_table :user_base do |t|
      t.string :login
      t.string :password
      t.timestamps
    end
    add_index :user_base, [:login, :password]
  end

  def self.down
    drop_table :user_base
  end

end
