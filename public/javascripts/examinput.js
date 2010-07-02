/*
 * Examinput
 *  
 */
var Examinput = Class.create({
     initialize: function() {
          this.exams_page = false;
          this.questions_page = false;
          if (jQuery('#exam_name').html() != null) {
               this.exams_page = true;
               this.exam_selection = jQuery('#exam_name');
               this.examid = jQuery('#exam_id');
               this.type_selection = jQuery('#exam_exam_type_id');
               this.date_selection = jQuery('#exam_date');
               this.maxpoints_selection = jQuery('#exam_maximum_points');
          } else if (jQuery('#questions').html() != null) {
               this.questions_page = true;
               this.questions_tabs_holder = jQuery('#questions');
          }
     },
     examsPage: function() {
          return this.exams_page;
     },
     questionsPage: function() {
          return this.questions_page;
     },
     addCalendar: function() {
          this.date_selection.datepicker({
               dateFormat: 'dd.mm.yy',
               showWeek: true,
               firstDay: 1,
               maxDate: '0'
          });
     },
     addExamSelection: function() {
          var getExamData = this._getExamData;
          var $this = this;
          this.exam_selection.change(function() {
               var exam_id = jQuery(this).val();
               getExamData($this, exam_id);
          });
     },
     _getExamData: function($this, examid) {
          if (examid == 'new') {
               $this._nonexistingExam();
          } else {
               // TODO: Add real functionality here to get json data from application.
               var data = {id: examid, type: 2, edate: '20.06.2010', maxpoints: 60}
               $this._existingExam(data);
          }
     },
     _nonexistingExam: function() {
          this.examid.attr('disabled', true);
          this.type_selection.val('');
          this.type_selection.removeAttr('disabled');
          this.date_selection.val('');
          this.date_selection.removeAttr('disabled');
          this.maxpoints_selection.val('');
          this.maxpoints_selection.removeAttr('disabled');
     },
     _existingExam: function(data) {
          this.examid.removeAttr('disabled');
          this.examid.val(data.id);
          this.type_selection.attr('disabled', true);
          this.type_selection.val(data.type);
          this.date_selection.attr('disabled', true);
          this.date_selection.val(data.edate);
          this.maxpoints_selection.attr('disabled', true);
          this.maxpoints_selection.val(data.maxpoints);
     },
     addTabs: function() {
          var $this = this;
          var tab_counter = 2;
          var $tabs = this.questions_tabs_holder.tabs({
               tabTemplate: '<li><a href="#{href}">#{label}</a> <a href="#remove"><span class="ui-icon ui-icon-close">Remove Tab</span></a></li>',
               idPrefix: 'questions-',
               add: function(event, ui) {
                    $this.addNewTab(event, ui);
                    $tabs.tabs('select', '#' + ui.panel.id);
               }
          });
          jQuery('a[href="#remove"]').live('click', function(event) {
               event.preventDefault();
               var index = jQuery('li', $tabs).index(jQuery(this).parent());
               $tabs.tabs('remove', index);
          });
          jQuery('a[href="#new_question"]').live('click', function(event) {
               event.preventDefault();
               $tabs.tabs('add', 'questions/'+tab_counter+'.json', 'Question #'+tab_counter, $tabs.tabs('length')-1);
               tab_counter++
          });
          $tabs.find('.ui-tabs-nav').sortable({
               axis:'x',
               items: 'li:not(.new-question)',
          });
     },
     addNewTab: function(event, ui) {
          jQuery(ui.panel).append('<p>Content of added tab</p>');
     }
});

jQuery(document).ready(function() {
     var examinput = new Examinput();
     if (examinput.examsPage()) {
          examinput.addExamSelection();
          examinput.addCalendar();
     } else if (examinput.questionsPage()) {
          examinput.addTabs();
     }
});
