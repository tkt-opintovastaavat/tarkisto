class Course < ActiveRecord::Base
     has_many :exams
     has_many :shortcuts
     belongs_to :course_level

     validates_presence_of :name, :credits, :code
     
     named_scope :basic_courses, :conditions => {:course_level_id => CourseLevel.find_by_name("Perusopinnot").id}
     named_scope :intermediate_courses, :conditions => {:course_level_id => CourseLevel.find_by_name("Aineopinnot").id}
     named_scope :advanced_courses, :conditions => {:course_level_id => CourseLevel.find_by_name("Syventävät opinnot").id}
     named_scope :other_courses , :conditions => {:course_level_id => CourseLevel.find_by_name("Muut opinnot").id}
end
