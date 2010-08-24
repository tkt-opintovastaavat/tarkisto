module DataObject

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
          themes = exam.course.themes
          course_themes = []
          themes.each do |t|
               course_themes << t.to_json
          end
          examhash = exam.attributes

          data_object = {"exam" => examhash, "questions" => questions, "modified" => false, "themes" => course_themes}
          return data_object.to_json
     end

     def save_data_object object

#          object = JSON::parse object

          unless object["exam"]["id"].nil?
               exam = Exam.find_by_id object["exam"]["id"]
          else
               exam = _new_exam object["exam"]
          end

          object["questions"].each do |q|
               q = q[1]
               unless q["id"] == "null"
                    question = Question.find_by_id q["id"]
               else
                    question = _new_question q, exam
               end
               
               question.points = q["points"] unless question.points == q["points"]
               question.description = q["description"] unless question.points == q["description"]
               question.name = q["name"] unless question.points == q["name"]
               
               unless q["codes"].nil?
                    q["codes"].each do |c|
                         if question.code_snippets.find_by_id(c).nil?
                              code = CodeSnippet.find_by_id c
                              code.question_id = question.id
                              code.save
                         end
                    end
               end
               unless q["images"].nil?
                    q["images"].each do |i|
                         if question.images.find_by_id(i).nil?
                              image = Image.find_by_id i
                              image.question_id = question.id
                              image.save
                         end
                    end
               end
               unless q["course_themes"].nil? 
                    q["course_themes"].each do |t|
                         if question.course_themes.find_by_id(t).nil?
                              course_theme = CourseTheme.find_by_id t
                              question.course_theme_questions.create :course_theme => course_theme
                         end
                    end
               end
               question.save
          end
          exam.publish!

          return exam

     end

     private

     def _new_exam e
          course = Course.find_by_id e["course_id"]
          course.exams.only_public.create( 
               :lecturer => 0 ,
               :type_id => e["type_id"].to_i, 
               :maximum_points => e["maximum_points"].to_i, 
               :date => e["date"], 
               :language => e["language"]
          )
     end

     def _new_question q, e
          e.questions.create( 
               :number => q["number"].to_i,
               :description => q["description"],
               :name => q["name"],
               :points => q["points"].to_i
          ) 
     end

     def _question_to_json q
          images = []
          q.images.each do |i|
               images << i.id
          end
          codes = []
          q.code_snippets.each do |c|
               codes << c.id
          end
          course_themes = []
          q.themes.each do |t|
               course_themes << t.id
          end
          return q.attributes.merge(
               {"images" => images, "codes" => codes, "course_themes" => course_themes}
          )
     end
end
