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
          respond_to do |format|
               format.html do
                    @exam = @course.exams.published.find_by_id(params[:id])

                    if @exam.nil?
                         redirect_to course_exams_url(@course.id)
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
                         redirect_to course_exams_url(@course.id)
                         return
                    end

                    send_data PdfExport.exam(@exam),
                              :filename => "#{@course.name} - #{@exam.name}.pdf"
               end
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
               if params[:exam].include? 'id' and !params[:exam][:id].nil? and !params[:exam][:id].empty?
                    @exam = @course.exams.find_by_id(params[:exam][:id])
                    redirect_to new_course_exam_url(@course.id) if @exam.nil?

               else
                    @exam = @course.exams.new params[:exam]
                    unless @exam.valid?
                         flash[:errors] = @exam.errors.full_messages
                         redirect_to new_course_exam_url(@course.id)
                    end
               end
          else
               redirect_to new_course_exam_url(@course.id)
          end
     end

     def preview
          @exam = Exam.build_exam params[:exam]
          render :action => :show
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
