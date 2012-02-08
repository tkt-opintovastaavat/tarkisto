class CreateCourses < ActiveRecord::Migration

  def self.up
    create_table :courses do |t|
      t.integer :code
      t.string :name_fi
      t.string :name_se
      t.string :name_en
      t.references :level
      t.integer :credits
      t.integer :replaced_by
      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end

end
