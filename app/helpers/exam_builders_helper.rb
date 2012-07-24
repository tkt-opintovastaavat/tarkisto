module ExamBuildersHelper

  def exam_builder_selection exam_builders
    exam_builders.collect {|eb| [eb.exam.name, eb.id, {:'data-date' => l(eb.exam.date, :format => :short), :'data-points' => eb.exam.maximum_points, :'data-type' => eb.exam.type_id}]}.concat([[t('pages.exams.forms.selection.new'), 'new']])
  end

end
