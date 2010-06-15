class CreateCourses < ActiveRecord::Migration
     def self.up
          create_table :courses do |t|
               t.integer :code
               t.string :name
               t.references :course_level, :options => "CONSTRAINT fk_course_level REFERENCES course_levels(id)"
               t.integer :credits
               t.references :replaced_by_course, :options => "CONSTRAINT fk_course REFERENCES courses(id)"
               t.timestamps
          end
     end

     def self.down
          drop_table :courses
     end
end
