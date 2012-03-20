class ExamBuildersController < ApplicationController

  load_and_authorize_resource

  before_filter :set_tab_as_new
  before_filter :assign_course
  before_filter :ensure_exam_builder, :only => [:show, :edit, :update]
  before_filter :check_if_user_is_in_builder, :only => [:new, :create]

  def show
    @exam_builder = current_user.exam_builder
  end

  def new
    provide_new_data
  end

  def create
    if params[:exam_builder][:id].blank?
      eb_params = params[:exam_builder]
      exam = @course.exams.new :type_id => eb_params[:type_id], :maximum_points => eb_params[:maximum_points], :date => eb_params[:date]
      if exam.save
        eb = ExamBuilder.create! :exam_id => exam.id, :user_id => current_user.id
        redirect_to course_exam_builder_path(@course)
      else
        provide_new_data
        render :new
      end
    else
      exam_builder = ExamBuilder.find_by_id params[:exam_name]
      exam_builder.update_attribute :user_id, current_user.id
      redirect_to course_exam_builder_path(@course)
    end
  end

  def edit
    @exam_builder = current_user.exam_builder
  end

  def update
  end

  private

  def provide_new_data
    @exam_builder = ExamBuilder.new
    @exam_builders = @course.exam_builders
    @types = Type.all
  end

  def set_tab_as_new
    set_tab :new
  end

  def assign_course
    @course = Course.find_by_id params[:course_id]
  end

  def ensure_exam_builder
    unless current_user.exam_builder
      redirect_to new_course_exam_builder_path(@course)
    end
  end

  def check_if_user_is_in_builder
    if current_user.exam_builder
      redirect_to course_exam_builder_path(@course)
    end
  end

end
