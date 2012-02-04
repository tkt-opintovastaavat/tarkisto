class ExamsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]

  include DataObject

  before_filter :_set_course

  skip_authorization_check :only => [:index, :show, :generate_preview]

  def index
    @exams = @course.exams.published
    @exams = @exams.only_public unless signed_in?
    respond_to do |format|
      format.html do
        set_tab :all
      end
    end
  end

  def show
    respond_to do |format|
      format.html do
        exams = @course.exams
        exams = exams.only_public unless signed_in?
        @exam = exams.published.find_by_id(params[:id])

        if @exam.nil?
          redirect_to course_exams_path(@course.id)
          return
        end

        @questions = @exam.questions
      end
      format.json do
        render :json => @course.exams.unpublished.find_by_id(params[:id]).to_public
      end
      format.pdf do
        @exam = @course.exams.published.find_by_id(params[:id])

        if @exam.nil?
          redirect_to course_exams_path(@course.id)
          return
        end

        send_data PdfExport.exam(@exam), :filename => "#{@course.name} - #{@exam.name}.pdf"
      end
    end
  end

  private

  def _set_course
    @course = Course.find_by_id(params[:course_id])
  end

end
