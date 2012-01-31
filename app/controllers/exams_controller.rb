class ExamsController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show, :generate_preview]

  include DataObject

  before_filter :_set_course

  skip_authorization_check :only => [:index, :show, :generate_preview]

  def index
    @exams = @course.exams.published
    @exams = @exams.only_public unless signed_in?
    respond_to do |format|
      format.html do
        set_tab :all
      end
    end
  end

  def show
    respond_to do |format|
      format.html do
        exams = @course.exams
        exams = exams.only_public unless signed_in?
        @exam = exams.published.find_by_id(params[:id])

        if @exam.nil?
          redirect_to course_exams_path(@course.id)
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
          redirect_to course_exams_path(@course.id)
          return
        end

        send_data PdfExport.exam(@exam), :filename => "#{@course.name} - #{@exam.name}.pdf"
      end
    end
  end

  def new
    authorize! :create, Exam
    @exam = Exam.new
    @exams = @course.exams.unpublished
    @types = []
    @types << Type.renewal_exams
    @types << Type.separate_exams
    @types << Type.course_exams


    respond_to do |format|
      format.html do
        set_tab :new
      end
    end
  end

  def create
    unless access?
      flash[:notice] = I18n.t('pages.session.notifications.access.denied')
      redirect_to :root
    else
      respond_to do |format|
        format.html do
          if params.include? 'exam'
            if params[:exam].include? 'id' and !params[:exam][:id].nil? and !params[:exam][:id].empty?
              @exam = @course.exams.find_by_id(params[:exam][:id])
              redirect_to new_course_exam_path(@course.id) if @exam.nil?

            else
              @exam = @course.exams.new params[:exam]
              unless @exam.valid?
                flash[:errors] = @exam.errors.full_messages
                redirect_to new_course_exam_path(@course.id)
              end
            end
          else
            redirect_to new_course_exam_path(@course.id)
          end
        end
        format.json do
          exam = save_data_object(params[:data])
          object = generate_data_object(exam)
          render :json => object
        end
      end
    end
  end

  def preview
    @exam = Exam.new params[:exam]
    render :action => :show
  end

  def generate_preview

    @course_themes = @course.course_themes

    if params[:commit] == t('pages.exams.forms.generate.continue')
      # Generate the basic info for the exam
      @generated_exam = Exam.generated_exams.new
      @generated_exam.course_id = @course.id
      @generated_exam.date = Date.today
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
      @generated_exam = Exam.generated_exams.new
      @generated_exam.course_id = @course.id
      @generated_exam.date = Date.today
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

            @already_in = false

            # Compare the candidate question to questions that were in the old exam
            @question_ids.each do |q_id|
              if q_id == question.id
                @already_in = true
                break
              end
            end

            # Compare the candidate question to questions already taken for this exam
            @generated_exam.questions.each do |e_q_id|
              if e_q_id == question.id
                @already_in = true
                break
              end
            end

            # If candidate question wasn't already in the old or this exam, add it
            if @already_in == false
              @generated_exam.questions << question
              break
            end
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
      @generated_exam = Exam.generated_exams.new
      @generated_exam.course_id = @course.id
      @generated_exam.date = Date.today
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
