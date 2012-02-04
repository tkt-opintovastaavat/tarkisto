class GeneratedExamsController < ApplicationController

  skip_before_filter :authenticate_user!
  skip_authorization_check

  before_filter :_set_course

  def new
    respond_to do |format|
      format.html do
        @course = Course.find_by_id params[:course_id]
        @exams = @course.exams.published
        @exams = @exams.only_public unless signed_in?
        @themes = @course.themes
        set_tab :generate
      end
    end
  end

  def create

    @course_themes = @course.course_themes

    # Generate the basic info for the exam
    @generated_exam = Exam.generated_exams.new
    @generated_exam.course_id = @course.id
    @generated_exam.date = Date.today
    @generated_exam.maximum_points = 0

    if params[:commit] == t('pages.exams.forms.generate.continue')

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
      @questions_string = @generated_exam.question_ids.join(',')

    elsif params[:commit] == t('pages.exams.forms.generate.generate')

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
            unless @already_in
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
      @questions_string = @generated_exam.question_ids.join(',')

    elsif params[:commit] == "PDF"
      @generated_exam.question_ids = params['questions'].split(',')

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
