class Instance < ActiveRecord::Base
     belongs_to :course
     
     # periodi olis hyvä olla pakollinen, mutta kun se ei ole "kurki-kannassakaan"...
     validates_presence_of :year, :semester
end