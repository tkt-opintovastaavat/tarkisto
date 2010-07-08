class ExamsController < ApplicationController

     before_filter :_set_course

     def index
          @exams = @course.exams.published
          respond_to do |format|
               format.html do
                    set_tab :all
               end
          end
     end

     def show
          @exam = @course.exams.published.find_by_id(params[:id])
          if @exam.nil?
               redirect_to exams_url(@course.id)
               return
          end

          respond_to do |format|
               format.html do
                    @questions = @exam.questions
               end
               format.pdf { send_data PdfExport.exam(@exam), :filename => "#{@course.name} - #{@exam.name}.pdf"} 
          end
     end

     def new
          @exam = Exam.new
          @exams = @course.exams.unpublished
          @types = Type.all

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
          @exam = @course.exams.find_by_id(params[:id])

          if @exam.nil?
               redirect_to new_exam_url(@course.id)
               return
          elsif @exam.published
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

end
