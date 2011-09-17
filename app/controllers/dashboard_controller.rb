class DashboardController < ApplicationController

  def show
    @basic_studies = Level.find_by_name_fi("Perusopinnot").courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @intermediate_studies = Level.find_by_name_fi("Aineopinnot").courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @advanced_studies = Level.find_by_name_fi("Syventävät opinnot").courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @other_studies = Level.find_by_name_fi("Muut opinnot").courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
  end

end

