class CoursesController < ApplicationController

     def basics
          @courses = Course.basic_courses
     end
     
     def intermediates
          @courses = Course.intermediate_courses
     end
     
     def advanceds
          @courses = Course.advanced_courses
     end
     
     def others
          @courses = Course.other_courses
     end

end
