class DashboardController < ApplicationController

  def show
    @basic_studies = Course.basic_courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @intermediate_studies = Course.intermediate_courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @advanced_studies = Course.advanced_courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
    @other_studies = Course.other_courses.alphabetize.courses_on_semester Date.today.year, SchoolDates.semester
  end

end
