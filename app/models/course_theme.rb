class CourseTheme < ActiveRecord::Base
     belongs_to :theme
     belongs_to :course

     has_many :course_theme_questions
     has_many :questions, :through => :course_theme_questions

     validates_presence_of :theme_id , :course_id

     def theme_name
          if (I18n.locale == :fi)
               return theme.name_fi
          elsif (I18n.locale == :en)
               return theme.name_en
          elsif (I18n.locale == :se)
               return theme.name_se
          end
     end

end
