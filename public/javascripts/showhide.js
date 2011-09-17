$(document).ready(function() {
  collapseAll();
  $('#examlists a[href="#toggle"]').live('click', showhide);
  $('a[href="#hideshow-noexams"]').live('click', showHideUnpublished);
});

function showHideUnpublished(event){
  $('.noexams').toggle();
  $('.noexams_add').toggle();
}

function showhide(event) {
  event.preventDefault();
  $(this).parent().next('.exams').toggle('slow');
}

function collapseAll() {
  $('.exams').hide();
}
