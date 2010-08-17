class ExamsController < ApplicationController

     include DataObject

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

                    send_data PdfExport.exam(@exam), :filename => "#{@course.name} - #{@exam.name}.pdf"
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
          respond_to do |format|
               format.html do
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
               format.json do
                    exam = save_data_object(params)
                    object = generate_data_object(exam)
                    render :json => object
               end
          end
     end

     def preview
          @exam = Exam.build_exam params[:exam]
          render :action => :show
     end

     def generate
          respond_to do |format|
               format.html do
               
                    @course_themes = @course.course_themes
               
                    # If there's commit parameter, it means that the generate button was pressed
                    if params.include? 'commit'
                         # Generate the basic info for the exam
                         @generated_exam = Exam.new
                         @generated_exam.course_id = @course.id
                         @generated_exam.date = Date.today
                         @generated_exam.type_id = Type.find_by_name_fi("Generoitu koe").id
                         
                         # Get all the questions for the course in random order, then pick only ones that match the themes
                         # and add those to the exam. Stop when have as many questions as the user wanted.
                         @all_questions = Course.find_by_id(@course).questions
                         @all_questions = @all_questions.sort_by{rand}
                         
                         @all_questions.each do |question|
                         
                              if @generated_exam.questions.size == params[:number].to_i
                                   break
                              end
                              
                              @course_themes.each do |theme|
                                   if params[theme.theme_id.to_s] == 'chosen' and question.course_themes.include? theme
                                        @generated_exam.questions << question
                                        break
                                   end
                              end
                              
                              # Themeless questions are handled separately because they have different params id
                              if params.include? 'themeless' and question.course_theme_questions.empty?
                                   @generated_exam.questions << question
                              end
                              
                         end
                         
                         # Fix the question numbers
                         @generated_exam.questions.each_with_index do |question, index|
                              question.number = index+1
                         end

                         
                         # If no questions were chosen, return
                         if @generated_exam.questions.empty?
                              redirect_to generate_course_exams_url(@course.id)
                         # Else send exam to be turned into pdf
                         else
                              send_data PdfExport.exam(@generated_exam), :filename => "#{@course.name} - #{@generated_exam.name}.pdf"
                         end
                         
                    
                    else
                         @exams = @course.exams.published
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
