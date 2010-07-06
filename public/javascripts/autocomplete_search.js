$(document).ready(function() {
     var availableTags = ["c++", "java", "php", "coldfusion", "javascript", "asp", "ruby", "python", "c", "scala", "groovy", "haskell", "perl"];
     $("#box input[type='text']").autocomplete({
          source: "/search/courses.json",
          minLength: 2,
          select: function(event, ui) {
               window.location = "/courses/"+ui.item.id+"/exams/"
          }
     });
});
