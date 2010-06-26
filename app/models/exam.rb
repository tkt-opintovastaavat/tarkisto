class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :exam_type

     validates_presence_of :date, :maximum_points

     named_scope :unpublished, :conditions => {:published => false}
     named_scope :published, :conditions => {:published => true}

     def name
          "#{exam_type.name} #{I18n.l date, :format => :short}"
     end
end
