class Course < ActiveRecord::Base
     has_many :exams
     has_many :shortcuts
     belongs_to :course_level

     validates_presence_of :name, :credits, :code
end
