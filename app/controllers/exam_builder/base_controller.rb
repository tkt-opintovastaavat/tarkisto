class ExamBuilder::BaseController < ApplicationController

  before_filter :assign_course
  before_filter :set_tab_as_new

  private

  def assign_course
    @course = Course.find_by_id params[:course_id]
  end

  def set_tab_as_new
    set_tab :new
  end

  def ensure_exam_builder
    if current_user.exam_builder
      if current_user.exam_builder.course != @course
        redirect_to course_exam_builder_path(current_user.exam_builder.course), :alert => t('pages.exams.forms.editexam.wrong_course')
      end
    else
      redirect_to new_course_exam_builder_path(@course)
    end
  end

  def check_if_user_is_in_builder
    if current_user.exam_builder
      redirect_to course_exam_builder_path(@course), :alert => t('pages.exams.forms.editexam.already_started')
    end
  end

end
