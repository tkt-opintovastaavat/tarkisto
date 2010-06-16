class CreateCourseShortcuts < ActiveRecord::Migration
     def self.up
          create_table :course_shortcuts do |t|

               t.string :shortcut
               t.references :course, :options => "CONSTRAINT fk_course REFERENCES courses(id)"
          end
     end

     def self.down
          drop_table :course_shortcuts
     end
end
