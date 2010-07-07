class Course < ActiveRecord::Base
     has_many :exams
     has_many :shortcuts
     has_many :instances
     belongs_to :level

     validates_presence_of :name_fi, :credits, :code

     named_scope :basic_courses, :conditions => {:level_id => Level.find_by_name_fi("Perusopinnot").id}
     named_scope :intermediate_courses, :conditions => {:level_id => Level.find_by_name_fi("Aineopinnot").id}
     named_scope :advanced_courses, :conditions => {:level_id => Level.find_by_name_fi("Syventävät opinnot").id}
     named_scope :other_courses , :conditions => {:level_id => Level.find_by_name_fi("Muut opinnot").id}
     named_scope :alphabetize, :order => :name_fi

     def name
          if (I18n.locale == :fi)
               return name_fi
          elsif (I18n.locale == :en)
               return name_en
          elsif (I18n.locale == :se)
               return name_se
          end
     end

     def has_exams?
          return !exams.published.empty?
     end
     
end
