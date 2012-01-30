class CoursesController < ApplicationController

  skip_before_filter :authenticate_user!

  def index
    @courses_json = format_json(Course.search(params[:term]))
    respond_to do |format|
      format.json{render :json => @courses_json}
    end
  end

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

  private

  def format_json courses
    courses.collect do |course|
      label = course.name
      if label.size - 3 > 60
        label = "#{label[0...55]}..."
      end
      {:id => course.id, :value => course.name, :label => label}
    end
  end

end
