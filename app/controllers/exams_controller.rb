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
          @exam = Exam.new
          @exams = @course.exams
          @exam_types = ExamType.all

          respond_to do |format|
               format.html do
                    set_tab :new
               end
          end
     end

     def create
          if params.include? 'exam'
               if params['exam'].include? 'id'
                    exam = @course.exams.find_by_id params['exam']['id']
               end
               if exam.nil?
                    exam = @course.exams.create params['exam'].delete_if{|key, value| key == 'id'}
               end
               unless exam.new_record?
                    redirect_to edit_exam_url(@course.id, exam.id)
                    return
               end
          end
          redirect_to new_exam_url(@course.id)
     end

     def edit
          _set_exam

          if @exam.published
               redirect_to exam_url(@course.id, @exam.id)
               return
          end

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
          @exam = @course.exams.find_by_id(params[:id])
     end

end
