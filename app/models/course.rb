class Course < ActiveRecord::Base
     has_many :exams
     has_many :shortcuts
     has_many :instances
     belongs_to :level

     validates_presence_of :name_fi, :credits, :code

     def name
          if (I18n.locale == :fi)
               return name_fi
          elsif (I18n.locale == :en)
               return name_en
          elsif (I18n.locale == :se)
               return name_se
          end
     end
     
     def self.search keyword
          if (I18n.locale == :fi)
               condition = "name_fi LIKE ?"
          elsif (I18n.locale == :en)
               condition = "name_en LIKE ?"
          elsif (I18n.locale == :se)
               condition = "name_se LIKE ?"
          else
               return nil
          end
          courses = Course.find :all, :conditions => [condition , "%#{keyword}%"]
          courses.sort_by { |name| name[:name_fi] }
     end
     
end
