class ExamType < ActiveRecord::Base
     has_many :exams

     validates_presence_of :name
end
