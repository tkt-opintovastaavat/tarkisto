class CreateExams < ActiveRecord::Migration
     def self.up
          create_table :exams do |t|
               t.references :type, :options => "CONSTRAINT fk_exam_type REFERENCES exam_types(id)"
               t.references :course, :options => "CONSTRAINT fk_course REFERENCES courses(id)"
               t.string :lecturer
               t.integer :maximum_points
               t.boolean :public, :default => false
               t.date :date
               t.timestamps
          end
     end

     def self.down
          drop_table :exams
     end
end
