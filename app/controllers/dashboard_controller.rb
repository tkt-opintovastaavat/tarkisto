class DashboardController < ApplicationController

     def show
          @basic_studies = Level.find_by_name_fi("Perusopinnot").courses
          @intermediate_studies = Level.find_by_name_fi("Aineopinnot").courses
          @advanced_studies = Level.find_by_name_fi("Syventävät opinnot").courses
          @other_studies = Level.find_by_name_fi("Muut opinnot").courses
     end

end
