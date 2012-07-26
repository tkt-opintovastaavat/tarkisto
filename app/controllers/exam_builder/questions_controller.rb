class ExamBuilder::QuestionsController < ExamBuilder::BaseController

  load_and_authorize_resource

  before_filter :ensure_exam_builder
  before_filter :assing_exam_builder

  def new
    @question = @exam_builder.exam.questions.new
  end

  def create
    @question = @exam_builder.exam.questions.new params[:question]
    if @question.save
      redirect_to course_exam_builder_path(@course)
    else
      render :new
    end
  end

  def edit
    @question = @exam_builder.exam.questions.find params[:id]
  end

  def update
    @question = @exam_builder.exam.questions.find params[:id]
    if @question.update_attributes params[:question]
      redirect_to course_exam_builder_path(@course)
    else
      render :edit
    end
  end

  def sort
    @exam_builder.sort_questions!(params[:questions])
    render :layout => false
  end

  private

  def assing_exam_builder
    @exam_builder = current_user.exam_builder
  end

end
