/*
 * Examinput
 *  
 */
var Examinput = Class.create({
     initialize: function() {
          this.exam_selection = jQuery('#exam_name');
          this.examid = jQuery('#exam_id');
          this.type_selection = jQuery('#exam_exam_type_id');
          this.date_selection = jQuery('#exam_date');
          this.maxpoints_selection = jQuery('#exam_maximum_points');
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
               var action = $this._existingExam;
               // TODO: Add real functionality here to get json data from application.
               var data = {id: examid, type: 2, edate: '20.06.2010', maxpoints: 60}
               action($this, data);
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
     _existingExam: function($this, data) {
          $this.examid.removeAttr('disabled');
          $this.examid.val(data.id);
          $this.type_selection.attr('disabled', true);
          $this.type_selection.val(data.type);
          $this.date_selection.attr('disabled', true);
          $this.date_selection.val(data.edate);
          $this.maxpoints_selection.attr('disabled', true);
          $this.maxpoints_selection.val(data.maxpoints);
     }
});

jQuery(document).ready(function() {
     var examinput = new Examinput();
     examinput.addExamSelection();
     examinput.addCalendar();
});
