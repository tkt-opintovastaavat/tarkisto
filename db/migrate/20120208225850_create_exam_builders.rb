class CreateExamBuilders < ActiveRecord::Migration

  def self.up
    create_table :exam_builders do |t|
      t.integer :user_id
      t.integer :exam_id
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :exam_builders
  end

end
