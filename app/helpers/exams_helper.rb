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
          data_object = {"exam" => exam, "questions" => questions, "modified" => false}
          return data_object.to_json
          
     end

     private

     def _question_to_json q
          images = []
          q.images.each do |i|
               images << i.attributes
          end
          codes = []
          q.code_snippets.each do |c|
               codes << c.attributes
          end
          themes = []
          q.themes.each do |t|
               themes << t.attributes
          end
          return q.attributes.merge(
               {"images" => images, "codes" => codes, "themes" => themes}
          )
     end
end
