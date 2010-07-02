class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :type
     has_many :question

     validates_presence_of :date, :lecturer, :maximum_points
end
