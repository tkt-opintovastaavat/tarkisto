class ExamBuilder < ActiveRecord::Base

  belongs_to :exam
  has_one :course, :through => :exam

  attr_accessor :date, :maximum_points

end
