$(document).ready(function() {
     collapseAll();
     $('#examlists a[href="#toggle"]').live('click', showhide);
});

function showhide(event) {
     event.preventDefault();
     $(this).parent().next('.exams').toggle('slow');
}

function collapseAll(objs) {
     $('.exams').hide();
}
