class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :exam_type

     validates_presence_of :date, :lecturer, :maximum_points
     
     named_scope :repeat_exams, :conditions => "(exam_type_id = 3)"
     named_scope :course_exams, :conditions => "(exam_type_id = 2)"
     named_scope :separate_exams, :conditions => "(exam_type_id = 1)"
end
