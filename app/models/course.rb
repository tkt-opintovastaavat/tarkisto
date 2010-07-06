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
          keyword = "%#{keyword}%"
          Course.find :all, :conditions => ["name_fi like ? or name_se like ? or name_en like ?" , keyword, keyword, keyword]
          #Course.find :all, :conditions => ["name_fi like ?", "%#{keyword}%"] or ["name_se like ?", "%#{keyword}%"] or ["name_en like ?", "%#{keyword}%"]
     end
     
end
