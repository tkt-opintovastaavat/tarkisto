/*
 * Variables
 */

var exam_selection = null;
var examid = null;
var type_selection = null;
var maxpoints_selection = null;
var date_selection = null;

/*
 * jQuery onload
 */

$(document).ready(function() {
  exam_selection = $('#exam_name');
  examid = $('#exam_builder_id');
  type_selection = $('#exam_builder_type_id');
  maxpoints_selection = $('#exam_builder_maximum_points');
  date_selection = $('#exam_builder_date');
  addExamSelection();
  addCalendar();
});

/*
 * Exam page
 */

function examsPage() {
  return ($('#exam_name').html() != null);
}

function addCalendar() {
  date_selection.datepicker({
    dateFormat: 'dd.mm.yy',
    showWeek: true,
    firstDay: 1,
    maxDate: '0'
  });
}

function addExamSelection() {
  this.exam_selection.change(function() {
    _getExamData($(this).val());
  });
}

function _getExamData(examid) {
  if (examid == 'new') {
    _nonexistingExam();
  } else {
    var opt = this.exam_selection.find('option[value="'+examid+'"]');
    _existingExam({id: examid, edate: opt.data('date'), maxpoints: opt.data('points'), type: opt.data('type')});
  }
}

function _nonexistingExam() {
  examid.attr('disabled', true);
  type_selection.val('');
  type_selection.removeAttr('disabled');
  date_selection.val('');
  date_selection.removeAttr('disabled');
  maxpoints_selection.val('');
  maxpoints_selection.removeAttr('disabled');
}

function _existingExam(data) {
  examid.removeAttr('disabled');
  examid.val(data.id);
  type_selection.attr('disabled', true);
  type_selection.val(data.type);
  date_selection.attr('disabled', true);
  date_selection.val(data.edate);
  maxpoints_selection.attr('disabled', true);
  maxpoints_selection.val(data.maxpoints);
}
