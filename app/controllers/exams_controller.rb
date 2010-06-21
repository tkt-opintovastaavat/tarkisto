class ExamsController < ApplicationController

     before_filter :_set_course

     def index
          respond_to do |format|
               format.html do
                    set_tab :all
               end
          end
     end

     def show
          _set_exam

          respond_to do |format|
               format.html
          end
     end

     def new
          @exams = @course.exams
          @exam_types = ExamType.all

          respond_to do |format|
               format.html do
                    set_tab :new
               end
          end
     end

     def create
          redirect_to edit_exam_url(@course, 1)
     end

     def edit
          _set_exam

          respond_to do |format|
               format.html do
                    set_tab :new
               end
          end
     end

     def generate
          respond_to do |format|
               format.html do
                    set_tab :generate
               end
          end
     end

     private

     def _set_course
          @course = Course.find_by_id(params[:course_id])
     end

     def _set_exam
          @exam = Exam.find_by_id(params[:id])
     end

end
