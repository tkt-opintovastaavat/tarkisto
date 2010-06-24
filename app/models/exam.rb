class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :exam_type

     validates_presence_of :date, :maximum_points

     def name
          "#{exam_type.name} #{I18n.l date, :format => :short}"
     end
end
