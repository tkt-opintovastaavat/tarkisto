class Instance < ActiveRecord::Base
     belongs_to :course
     has_many :attendances
    
     # periodi olis hyvä olla pakollinen, mutta kun se ei ole "kurki-kannass$
     validates_presence_of :year, :semester
                    
end
                
