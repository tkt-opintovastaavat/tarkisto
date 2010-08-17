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
                    @exams = @course.exams.published
                    @course_themes = @course.course_themes
                    set_tab :generate
               end
          end
     end

     def generate_preview
     
          @course_themes = @course.course_themes
          
          if params[:commit] == t('pages.exams.forms.generate.continue')
               # Generate the basic info for the exam
               @generated_exam = Exam.new
               @generated_exam.course_id = @course.id
               @generated_exam.date = Date.today
               @generated_exam.type_id = Type.find_by_name_fi("Generoitu koe").id
               @generated_exam.maximum_points = 0
                         
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
                    @generated_exam.maximum_points = @generated_exam.maximum_points + question.points
               end

               # Make the hidden id string passing the question ids
               @questions_string = ''
               
               @generated_exam.questions.each do |question|
                    if question.number == 1
                         @questions_string = @questions_string + question.id.to_s
                    else
                         @questions_string = @questions_string + ',' + question.id.to_s
                    end
               end
               
               
          elsif params[:commit] == t('pages.exams.forms.generate.generate')

               # Generate the basic info for the exam, again, because objects don't pass correctly in params
               @generated_exam = Exam.new
               @generated_exam.course_id = @course.id
               @generated_exam.date = Date.today
               @generated_exam.type_id = Type.find_by_name_fi("Generoitu koe").id
               @generated_exam.maximum_points = 0
               
               # Parse the question ids from params
               @question_ids = params['questions'].split(',')
               
               # Compare the numbers of the questions to be changed to ids of all the questions to filter out the ones to keep
               @question_ids.each_with_index do |id, index|
                    if params[(index+1).to_s] == 'chosen'
                         # It's chosen to be changed, so don't take it
                    else
                         @generated_exam.questions << Question.find_by_id(id)
                    end
               
               end
               
               # Get all the questions for the course in random order, then pick only ones that match the themes
               # and add those to the exam. Stop when have as many questions as the user wanted.
               @all_questions = Course.find_by_id(@course).questions
               @all_questions = @all_questions.sort_by{rand}
                         
               @all_questions.each do |question|
                         
                    if @generated_exam.questions.size == @question_ids.size
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
                    @generated_exam.maximum_points = @generated_exam.maximum_points + question.points
               end

               # Make the hidden id string passing the question ids
               @questions_string = ''
               
               @generated_exam.questions.each do |question|
                    if question.number == 1
                         @questions_string = @questions_string + question.id.to_s
                    else
                         @questions_string = @questions_string + ',' + question.id.to_s
                    end
               end
               
                         
          elsif params[:commit] == "PDF"
          
               # Generate the basic info for the exam, again, because objects don't pass correctly in params
               @generated_exam = Exam.new
               @generated_exam.course_id = @course.id
               @generated_exam.date = Date.today
               @generated_exam.type_id = Type.find_by_name_fi("Generoitu koe").id
               @generated_exam.maximum_points = 0
          
               # Parse the question ids from params and add them to the exam
               @question_ids = params['questions'].split(',')
               
               @question_ids.each do |id|
                    @generated_exam.questions << Question.find_by_id(id.to_i)
               end
          
               # Fix the question numbers
               @generated_exam.questions.each_with_index do |question, index|
                    question.number = index+1
                    @generated_exam.maximum_points = @generated_exam.maximum_points + question.points
               end
               
               send_data PdfExport.exam(@generated_exam), :filename => "#{@generated_exam.course.name} - #{@generated_exam.name}.pdf"
               
          end
     
     end
     
     private

     def _set_course
          @course = Course.find_by_id(params[:course_id])
     end

end
