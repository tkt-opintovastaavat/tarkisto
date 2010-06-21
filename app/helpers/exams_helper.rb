module ExamsHelper

     def exam_selection exams
          exams.collect {|exam| [exam.name, exam.id]}.concat([[t('pages.exams.forms.selection.new'), 'new']])
     end

     def exam_type_selection exam_types
          exam_types.collect {|etype| [etype.name, etype.id]}
     end

end
