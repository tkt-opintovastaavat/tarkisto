module ExamsHelper

     def exam_selection exams
          exams.collect {|exam| [exam.name, exam.id]}.concat([[t('pages.exams.forms.selection.new'), 'new']])
     end

     def type_selection types
          types.collect {|etype| [etype.name, etype.id]}
     end

     def question_name_for_exam_input name
          if name.nil?
               t('pages.exams.forms.questions.anon')
          else
               "#{name[0...15]}..."
          end
     end

     def generate_data_object exam
          questions = []
          unless exam[:id].nil?
               exam.questions.each do |q|
                   questions << _question_to_json(q)
               end
          end
          examhash = exam.attributes

          data_object = {"exam" => examhash, "questions" => questions, "modified" => false}
          return data_object.to_json
     end

     def save_data_object object

          object = JSON::parse object

          unless object["exam"]["id"].nil?
               exam = Exam.find_by_id object["exam"]["id"]
          else
               exam = _new_exam object["exam"]
          end

          object["questions"].each do |q|
               unless q["id"].nil?
                    question = Question.find_by_id q["id"]
               else
                    question = _new_question q, exam
               end
               q["codes"].each do |c|
                    if question.code_snippets.find_by_id(c).nil?
                         code = CodeSnippet.find_by_id c
                         code.question_id = question
                         code.save
                    end
               end
               q["images"].each do |i|
                    if question.images.find_by_id(i).nil?
                         image = Image.find_by_id i
                         image.question_id = question
                         image.save
                    end
               end
               q["course_themes"].each do |t|
                    if question.course_themes.find_by_id(t).nil?
                         course_theme = CourseTheme.find_by_id t
                         question.course_theme_questions.create :course_theme => course_theme
                    end
               end
          end
     end

     private

     def _new_exam e
          course = Course.find_by_id e["course_id"]
          course.exams.only_public.create( 
               :lecturer => 0 ,
               :type_id => e["type_id"], 
               :maximum_points => e["maximum_points"], 
               :date => e["date"], 
               :language => e["language"]
          )
     end

     def _new_question q, e
          e.questions.create( 
               :number => q["number"],
               :description => q["description"],
               :name => q["name"],
               :points => q["points"]
          ) 
     end

     def _question_to_json q
          images = []
          q.images.each do |i|
               images << i.attributes["id"]
          end
          codes = []
          q.code_snippets.each do |c|
               codes << c.attributes["id"]
          end
          course_themes = []
          q.themes.each do |t|
               course_themes << t.attributes["id"]
          end
          return q.attributes.merge(
               {"images" => images, "codes" => codes, "course_themes" => course_themes}
          )
     end
end
