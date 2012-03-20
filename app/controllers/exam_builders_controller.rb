class ExamBuildersController < ApplicationController

  load_and_authorize_resource

  before_filter :set_tab_as_new
  before_filter :assign_course

  def show
  end

  def new
    @exam_builder = ExamBuilder.new
    @exam_builders = @course.exam_builders
    @types = Type.all
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_tab_as_new
    set_tab :new
  end

  def assign_course
    @course = Course.find_by_id params[:course_id]
  end

end
