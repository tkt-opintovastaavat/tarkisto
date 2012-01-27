class CourseTheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :course

  has_many :course_theme_questions
  has_many :questions, :through => :course_theme_questions

  validates_presence_of :theme_id , :course_id
  validates_uniqueness_of :theme_id, :scope => :course_id

end
