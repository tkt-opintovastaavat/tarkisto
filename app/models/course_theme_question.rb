class CourseThemeQuestion < ActiveRecord::Base
     has_many :course_themes
     has_many :questions

     validates_presence_of :course_theme_id, :question_id
end
