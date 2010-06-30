class CourseTheme < ActiveRecord::Base
     has_many :themes
     has_many :courses

     belongs_to :course_theme_questions

     validates_presence_of :theme_id , :course_id
end
