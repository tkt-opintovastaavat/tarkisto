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
               redirect_to course_exams_url(@course.id)
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
                    redirect_to edit_course_exam_url(@course.id, exam.id)
                    return
               end
          end
          redirect_to new_course_exam_url(@course.id)
     end

     def edit
          @exam = @course.exams.find_by_id(params[:id])

          if @exam.nil?
               redirect_to new_course_exam_url(@course.id)
               return
          elsif @exam.published
               redirect_to course_exam_url(@course.id, @exam.id)
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
               
                    # If there's course_theme parameters, it means that the generate button was pressed
                    if params.include? 'course_theme'
                         # Generate the basic info
                         generated_exam = Exam.new
                         generated_exam.course_id = @course.id
                         generated_exam.date = Date.today
                         generated_exam.type_id = Type.find_by_name_fi("Generoitu koe")
                         
                         # Extract the themes array from parameters
                         chosen_themes = params[:course_theme]
                         
                         # Get all the questions for the course in random order, then pick only ones that match the themes
                         all_questions = Course.find_by_id(@course).questions (:order => 'random()')
                         
                         all_questions.each do |question|
                              
                              chosen_themes.each do |theme|
                                   if question.course_themes.first.id == theme.id
                                        generated_exam.questions << question
                                   end
                              end
                         end
                         
                         # If no questions were chosen, return (display alert maybe?)
                         if generated_exam.questions.empty?
                              redirect_to generate_course_exams_url(@course.id)
                         # Else send exam to be turned into pdf
                         else
                              send_data PdfExport.exam(generated_exam), :filename => "#{@course.name} - #{generated_exam.name}.pdf"
                         end
                         
                    
                    else
                         @exams = @course.exams.published
                         @course_themes = @course.course_themes
                    end
                    set_tab :generate
               end
          end
     end

     private

     def _set_course
          @course = Course.find_by_id(params[:course_id])
     end

end
