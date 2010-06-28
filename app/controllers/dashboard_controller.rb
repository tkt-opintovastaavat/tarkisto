class DashboardController < ApplicationController

     def show
          @basic_studies = CourseLevel.find_by_name("Perusopinnot").courses[0...5]
          @intermediate_studies = CourseLevel.find_by_name("Aineopinnot").courses[0...5]
          @advanced_studies = CourseLevel.find_by_name("Syventävät opinnot").courses[0...5]
          @other_studies = CourseLevel.find_by_name("Muut opinnot").courses[0...5]
     end

end
