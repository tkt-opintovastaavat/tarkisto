class CoursesController < ApplicationController

  def basics
    @courses = Course.basic_courses.alphabetize
  end

  def intermediates
    @courses = Course.intermediate_courses.alphabetize
  end

  def advanceds
    @courses = Course.advanced_courses.alphabetize
  end

  def others
    @courses = Course.other_courses.alphabetize
  end

end
