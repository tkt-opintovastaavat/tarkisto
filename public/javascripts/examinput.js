/*
 * Variables
 */

var exam_selection = null;
var examid = null;
var type_selection = null;
var maxpoints_selection = null;
var date_selection = null;

var questions_tabs_holder = null;

/*
 * jQuery onload
 */

$(document).ready(function() {
     if (examsPage()) {
          exam_selection = jQuery('#exam_name');
          examid = jQuery('#exam_id');
          type_selection = jQuery('#exam_type_id');
          maxpoints_selection = jQuery('#exam_maximum_points');
          date_selection = jQuery('#exam_date');
          addExamSelection();
          addCalendar();
     } else if (questionsPage()) {
          questions_tabs_holder = jQuery('#questions');
          addTabs();
          //FIXME: later ..
          $('a[href="#show-picture"]').live('click', function(event) {
               event.preventDefault();
               alert('This will pop-up an dialog with picture');
          });
          $('a[href="#show-code"]').live('click', function(event) {
               event.preventDefault();
               alert('This will pop-up an dialog with code');
          });
          $('a[href="#delete-pic"]').live('click', function(event) {
               event.preventDefault();
               if (confirm('Do you want to delete picture?'))
                    alert('This will delete the picture');
          });
          $('a[href="#delete-code"]').live('click', function(event) {
               event.preventDefault();
               if (confirm('Do you want to delete code?'))
                    alert('This will delete the code');
          });
     }
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
          // TODO: Add real functionality here to get json data from application.
          var data = {id: examid, type: 2, edate: '20.06.2010', maxpoints: 60}
          _existingExam(data);
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

/*
 * Questions page
 */

function questionsPage() {
     return ($('#questions').html() != null);
}

function addTabs() {
     var tab_counter = 2;
     var $tabs = questions_tabs_holder.tabs({
          tabTemplate: '<li><a href="#{href}">#{label}</a> <a href="#remove"><span class="ui-icon ui-icon-close">Remove Tab</span></a></li>',
          idPrefix: 'questions-',
          add: function(event, ui) {
               _addNewTab(event, ui);
               $tabs.tabs('select', '#' + ui.panel.id);
          }
     });

     $('a[href="#remove"]').live('click', function(event) {
          event.preventDefault();
          var index = $('li', $tabs).index($(this).parent());
          $tabs.tabs('remove', index);
     });

     $('a[href="#new_question"]').live('click', function(event) {
          event.preventDefault();
          $tabs.tabs('add', 'questions/'+tab_counter+'.json', 'Question #'+tab_counter, $tabs.tabs('length')-1);
          tab_counter++
     });
     $tabs.find('.ui-tabs-nav').sortable({
          axis:'x',
          items: 'li:not(.new-question)',
     });
}

function _addNewTab(event, ui) {
     $(ui.panel).append('<p>Content of added tab</p>');
}
