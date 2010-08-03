class DashboardController < ApplicationController

     def show
          @basic_studies = Level.find_by_name_fi("Perusopinnot").courses.alp$
          @intermediate_studies = Level.find_by_name_fi("Aineopinnot").cours$
          @advanced_studies = Level.find_by_name_fi("Syventävät opinnot").co$
          @other_studies = Level.find_by_name_fi("Muut opinnot").courses.alp$
     end
          
end
                                                  
