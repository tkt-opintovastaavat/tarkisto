class Course < ActiveRecord::Base
     has_many :exams
     has_many :questions, :through => :exams
     has_many :shortcuts
     has_many :instances
     has_many :course_themes
     has_many :themes, :through => :course_themes
     belongs_to :level

     validates_presence_of :name_fi, :credits, :code

     named_scope :basic_courses, :conditions => {:level_id => Level.find_by_name_fi("Perusopinnot").id}
     named_scope :intermediate_courses, :conditions => {:level_id => Level.find_by_name_fi("Aineopinnot").id}
     named_scope :advanced_courses, :conditions => {:level_id => Level.find_by_name_fi("Syventävät opinnot").id}
     named_scope :other_courses , :conditions => {:level_id => Level.find_by_name_fi("Muut opinnot").id}
     named_scope :alphabetize, :order => :name_fi
     named_scope :courses_on_semester, lambda { |year, semester|
          { :joins => :instances, :conditions => ["instances.year = ? AND instances.semester = ?", year, semester] }
     }

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
          courses.sort { |course1, course2| sorting_priority keyword, course1, course2 }
     end
     
     def self.sorting_priority keyword, course1, course2
          first_starts_with_keyword = !course1.name.scan(/^#{keyword}/i).empty?
          second_starts_with_keyword = !course2.name.scan(/^#{keyword}/i).empty?               
          if first_starts_with_keyword and second_starts_with_keyword
               course1.name <=> course2.name
          elsif first_starts_with_keyword and not second_starts_with_keyword
               -1
          elsif not first_starts_with_keyword and second_starts_with_keyword
               1
          else
               course1.name <=> course2.name
          end
     end

     def has_exams?
          return !exams.published.empty?
     end
     
end
