class CreateCourseThemeQuestions < ActiveRecord::Migration

  def self.up
    create_table :course_theme_questions do |t|
      t.references :course_theme
      t.references :question
    end
  end

  def self.down
    drop_table :course_theme_questions
  end

end
