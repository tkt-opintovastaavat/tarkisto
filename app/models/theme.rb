class Theme < ActiveRecord::Base
     has_many :course_themes
     has_many :courses, :through => :course_themes

     validates_presence_of :name_fi
end
