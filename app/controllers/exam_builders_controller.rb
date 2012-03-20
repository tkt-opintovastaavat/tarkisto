class ExamBuildersController < ApplicationController

  load_and_authorize_resource

  before_filter :set_tab_as_new
  before_filter :assign_course

  before_filter :check_if_user_is_in_builder, :only => [:new, :create]

  def show
  end

  def new
    @exam_builder = ExamBuilder.new
    @exam_builders = @course.exam_builders
    @types = Type.all
  end

  def create
    if params[:exam_name] == 'new'
      raise params.inspect
    else
      exam_builder = ExamBuilder.find_by_id params[:exam_name]
      exam_builder.update_attribute :user_id, current_user.id
      redirect_to edit_course_exam_builder_path(@course)
    end
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

  def check_if_user_is_in_builder
    if current_user.exam_builder
      redirect_to edit_course_exam_builder_path(@course)
    end
  end

end
