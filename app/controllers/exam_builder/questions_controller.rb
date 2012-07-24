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

  private

  def assing_exam_builder
    @exam_builder = current_user.exam_builder
  end

end
