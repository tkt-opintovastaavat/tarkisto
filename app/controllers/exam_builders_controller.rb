class ExamBuildersController < ExamBuilder::BaseController

  load_and_authorize_resource

  before_filter :ensure_exam_builder, :only => [:show, :edit, :update, :destroy]
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
    redirect_to course_exam_builder_path(@course)
  end

  def publish
    @exam_builder = current_user.exam_builder
    @exam_builder.publish!
    redirect_to course_exam_path(@course, @exam_builder.exam.id)
  end

  def destroy
    @exam_builder = current_user.exam_builder
    @exam_builder.release!
    redirect_to new_course_exam_builder_path(@exam_builder.course)
  end

  private

  def provide_new_data
    @exam_builder = ExamBuilder.new
    @exam_builders = @course.exam_builders
    @types = Type.all
  end

end
