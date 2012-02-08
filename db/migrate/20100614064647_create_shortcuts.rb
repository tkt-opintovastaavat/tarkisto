class CreateShortcuts < ActiveRecord::Migration

  def self.up
    create_table :shortcuts do |t|
      t.string :name
      t.references :course
    end
  end

  def self.down
    drop_table :shortcuts
  end

end
