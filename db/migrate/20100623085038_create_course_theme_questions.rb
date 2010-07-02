class CreateCourseThemeQuestions < ActiveRecord::Migration
     def self.up
          create_table :course_theme_questions do |t|
               t.references :course_theme, :options => "CONSTRAINT fk_course_theme REFERENCES course_themes(id)"
               t.references :question, :options => "CONSTRAINT fk_question REFERENCES questions(id)"
          end
     end

     def self.down
          drop_table :course_theme_questions
     end
end
