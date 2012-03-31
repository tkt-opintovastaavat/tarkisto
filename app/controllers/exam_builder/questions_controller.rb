class ExamBuilder::QuestionsController < ExamBuilder::BaseController

  load_and_authorize_resource

  before_filter :ensure_exam_builder

  def new
    @exam_builder = current_user.exam_builder
  end

end
