class DashboardController < ApplicationController
     
     def show
          @basic_studies = Level.find_by_name_fi("Perusopinnot").courses.alphabetize.courses_on_semester Date.today.year, semester
          @intermediate_studies = Level.find_by_name_fi("Aineopinnot").courses.alphabetize.courses_on_semester Date.today.year, semester
          @advanced_studies = Level.find_by_name_fi("Syventävät opinnot").courses.alphabetize.courses_on_semester Date.today.year, semester
          @other_studies = Level.find_by_name_fi("Muut opinnot").courses.alphabetize.courses_on_semester Date.today.year, semester
     end
     
     protected
     def semester
          @month = Date.today.month
          if (1..5).include?(@month)
               'K'
          elsif (6..8).include?(@month)
               'S'# <---DEMO!! LAITA TÄHÄN: 'V'
          else (9..12).include?(@month)
               'S'
          end
     end

end
