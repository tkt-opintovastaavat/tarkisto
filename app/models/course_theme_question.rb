class CourseThemeQuestion < ActiveRecord::Base
  belongs_to :course_theme
  belongs_to :question
  has_one :theme, :through => :course_theme

  validates_presence_of :course_theme_id, :question_id
end
