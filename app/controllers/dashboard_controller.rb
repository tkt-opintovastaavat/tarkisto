class DashboardController < ApplicationController

     def show
          @basic_studies = Course.basic_courses.alphabetize.courses_on_semester 2010, 'S'
          @intermediate_studies = Course.intermediate_courses.alphabetize.courses_on_semester 2010, 'S'
          @advanced_studies = Course.advanced_courses.alphabetize.courses_on_semester 2010, 'S'
          @other_studies = Course.other_courses.alphabetize.courses_on_semester 2010, 'S'
     end

end
