class CreateInstances < ActiveRecord::Migration

  def self.up
    create_table :instances do |t|
      t.references :course
      t.integer :period
      t.integer :year
      t.string :semester
      t.timestamps
    end
  end

  def self.down
    drop_table :instances
  end

end
