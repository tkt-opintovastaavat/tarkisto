module ExamBuildersHelper

  def exam_builder_selection exams
    exams.collect {|exam| [exam.name, exam.id, {:'data-date' => l(exam.date, :format => :short), :'data-points' => exam.maximum_points, :'data-type' => exam.type_id}]}.concat([[t('pages.exams.forms.selection.new'), 'new']])
  end

end
