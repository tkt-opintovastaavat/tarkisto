class GeneratedExamsController < ApplicationController

  skip_before_filter :authenticate_user!
  skip_authorization_check

  def new
    respond_to do |format|
      format.html do
        @course = Course.find_by_id params[:course_id]
        @exams = @course.exams.published
        @exams = @exams.only_public unless signed_in?
        @themes = @course.themes
        set_tab :generate
      end
    end
  end

end
