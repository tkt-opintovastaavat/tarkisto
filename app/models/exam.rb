class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :exam_type

     validates_presence_of :date, :lecturer, :maximum_points
     
     named_scope :repeat_exams, :conditions => {:exam_type_id => ExamType.find_by_name('Uusintakoe').id}
     named_scope :course_exams, :conditions => {:exam_type_id => ExamType.find_by_name('Kurssikoe').id}
     named_scope :separate_exams, :conditions => {:exam_type_id => ExamType.find_by_name('Erilliskoe').id}
end
