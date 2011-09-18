class DashboardController < ApplicationController

  def show
    @basic_studies = Level.basic_studies.courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @intermediate_studies = Level.intermediate_studies.courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @advanced_studies = Level.advanced_studies.courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @other_studies = Level.other_studies.courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
  end

end
