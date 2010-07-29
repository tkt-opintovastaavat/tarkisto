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

end
