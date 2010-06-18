class DashboardController < ApplicationController

     def show
          @basic_studies = CourseLevel.find_by_name("Perusopinnot").courses
          @intermediate_studies = CourseLevel.find_by_name("Aineopinnot").courses
          @advanced_studies = CourseLevel.find_by_name("Syventävät opinnot").courses
          @other_studies = CourseLevel.find_by_name("Muut opinnot").courses
     end

end
