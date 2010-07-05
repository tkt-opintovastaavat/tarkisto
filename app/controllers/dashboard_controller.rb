class DashboardController < ApplicationController

     def show
          @basic_studies = Level.find_by_name_fi("Perusopinnot").courses[0...5]
          @intermediate_studies = Level.find_by_name_fi("Aineopinnot").courses[0...5]
          @advanced_studies = Level.find_by_name_fi("Syventävät opinnot").courses[0...5]
          @other_studies = Level.find_by_name_fi("Muut opinnot").courses[0...5]
     end

end
