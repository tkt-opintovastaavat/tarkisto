class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :exam_type

     validates_presence_of :date, :lecturer, :maximum_points

     def name
          "#{exam_type.name} #{date}"
     end
end
