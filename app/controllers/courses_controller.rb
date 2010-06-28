class CoursesController < ApplicationController

     def basics
          @courses = CourseLevel.find_by_name("Perusopinnot").courses
     end
     
     def intermediates
          @courses = CourseLevel.find_by_name("Aineopinnot").courses
     end
     
     def advanceds
          @courses = CourseLevel.find_by_name("Syventävät opinnot").courses
     end
     
     def others
          @courses = CourseLevel.find_by_name("Muut opinnot").courses
     end

end
