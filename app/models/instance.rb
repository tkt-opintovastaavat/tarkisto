class Instance < ActiveRecord::Base
     belongs_to :course
     has_many :attendances
    
     # periodi olis hyvä olla pakollinen, mutta kun se ei ole "kurki-kannass$
     validates_presence_of :year, :semester
     
     def name
          if (I18n.locale == :fi)
               return course.name_fi
          elsif (I18n.locale == :en)
               return course.name_en
          elsif (I18n.locale == :se)
               return course.name_se
          end
     end                 
end
                
