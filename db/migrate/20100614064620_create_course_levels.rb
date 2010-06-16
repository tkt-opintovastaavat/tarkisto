class CreateCourseLevels < ActiveRecord::Migration
     def self.up
          create_table :course_levels do |t|
               t.string :name
          end
     end

     def self.down
          drop_table :course_levels
     end
end
