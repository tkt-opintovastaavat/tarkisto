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
          unless exam[:id].nil?
               questions = []
               exam.questions.each do |q|
                    _question_to_json(q, questions)
               end
          end
     end

     private

     def _question_to_json q, questions
          images = []
          q.images.each do |i|
               images << i.attributes.to_json
          end
          codes = []
          q.code_snippets.each do |c|
               codes << c.attributes.to_json
          end
          themes = []
          q.themes.each do |t|
               themes << t.attributes.to_json
          end
          questions << q.attributes.merge(
               {"images" => images, "codes" => codes, "themes" => themes}
          ).to_json
     end
end
