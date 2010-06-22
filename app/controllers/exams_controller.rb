class ExamsController < ApplicationController

     # set_tab is tabs_on_rails method that sets the current tab as the one specified
     def index
          set_tab :all
          @course = Course.find_by_id(params[:course_id])
          @course_exams = Exam.all(:conditions => ["course_id = ? AND exam_type_id = ?", params[:course_id], 2])
          @separate_exams = Exam.all(:conditions => ["course_id = ? AND exam_type_id = ?", params[:course_id], 1])
          @repeat_exams = Exam.all(:conditions => ["course_id = ? AND exam_type_id = ?", params[:course_id], 3])
     end

     def show
          @course = Course.find_by_id(params[:course_id])
          @exam = Exam.find_by_id(params[:id])
     end

     def new
          set_tab :new
          @course = Course.find_by_id(params[:course_id])
     end

     def generate
          set_tab :generate
          @course = Course.find_by_id(params[:course_id])
     end

end
