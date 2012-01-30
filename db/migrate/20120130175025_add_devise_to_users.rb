class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
    end

    add_index :users, :username,     :unique => true
    add_index :users, :unlock_token, :unique => true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
