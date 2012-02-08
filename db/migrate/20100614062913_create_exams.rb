class CreateExams < ActiveRecord::Migration

  def self.up
    create_table :exams do |t|
      t.references :type
      t.references :course
      t.string :lecturer
      t.integer :maximum_points
      t.boolean :public, :default => false
      t.boolean :published, :default => false
      t.date :date
      t.string :language
      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end

end
