class CreateCourseThemes < ActiveRecord::Migration
     def self.up
          create_table :course_themes do |t|
               t.references :theme, :option => "CONSTRAINT fk_theme REFERENCES themes(id)"
               t.string :description_fi
               t.string :description_en
               t.string :description_se
               t.references :course, :option => "CONSTRAINT fk_course REFERENCES courses(id)"
          end
     end

     def self.down
          drop_table :course_themes
     end
end
