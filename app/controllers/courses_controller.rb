class CoursesController < ApplicationController

     def basics
          @courses = Course.basic_courses.alphabetize
     end
     
     def intermediates
          @courses = Course.intermediate_courses.alphabetize
     end
     
     def advanceds
          @courses = Course.advanced_courses.alphabetize
     end
     
     def others
          @courses = Course.other_courses.alphabetize
     end

     active_scaffold :course do |config|
          config.label = "Course"
          config.columns = [ :code, :name_fi, :credits ]
          list.sorting = {:name_fi => 'ASC'}
          columns[:code].label = "Code: #"
          columns[:name_fi].label = "Name: #"
          columns[:credits].label = "Credits: #"
     end

end
