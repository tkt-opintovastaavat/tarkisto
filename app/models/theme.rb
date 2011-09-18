class Theme < ActiveRecord::Base
  include LocalizeName

  has_many :course_themes
  has_many :course_theme_questions, :through => :course_themes
  has_many :courses, :through => :course_themes

  validates_presence_of :name_fi

end
