// FIXME: Enable confirmation later
//window.onbeforeunload = confirmExit;

function confirmExit() { 
     // FIXME: Add confirmation check.
     return "Sinulla on tallentamattomia muutoksia, haluatko varmasti poistua?";
}

var lastQuestionId = 0;

$(document).ready(function() {
     var $tabs = $('#questions').tabs({
          tabTemplate: '<li><a href="#{href}">#{label}</a> <a href="#remove"><span class="ui-icon ui-icon-close">Remove Tab</span></a></li>',
          idPrefix: 'questions-',
          add: function(event, ui) {
               $tabs.tabs('select', '#' + ui.panel.id);
          }
     });

     $('a[href="#new_question"]').unbind().live('click', function(event) {
          event.preventDefault();
          if (!lastQuestionId)
               lastQuestionId = 0;
          var question = createExamQuestion(lastQuestionId);
          dataObject.questions.push(question);
          $(createQuestionBox(question)).appendTo('#questions');
          $tabs.tabs('add', '#questions-' + lastQuestionId, I18n.t('pages.exams.forms.questions.anon'));
          lastQuestionId++;
     });

     $('a[href="#remove"]').live('click', function(event) {
          event.preventDefault();
          var index = $('li', $tabs).index($(this).parent());
          if (confirm(I18n.t('pages.exams.forms.questions.delete'))) {
               $tabs.tabs('remove', index);
          }
     });
});

function createQuestionBox(data) {
     return $('<div />').attr('id', 'questions-' + lastQuestionId).append($('<table />').append($('<tr />').append($('<td />').append(createQuestionDataBox(data))).append($('<td />').append(createQuestionMetaBox(data)))));
}

function createQuestionDataBox(data) {
     return $('<div />').append(createQuestionDataNameBox(data)).append(createQuestionDataDescriptionBox(data)).append(createQuestionDataPointsBox(data)).append(createQuestionDataThemesBox(data));
}

function createQuestionDataNameBox(data) {
     var textarea = $('<textarea />').addClass('question-name').attr('id', 'question_name').change(function (){
          data.name = $(this).val();
     });
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.name'))).append(textarea);
}

function createQuestionDataDescriptionBox(data) {
     var textarea = $('<textarea />').addClass('question-content').attr('id', 'question_description').change(function () {
          data.description = $(this).val();
     });
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.description'))).append(textarea);
}

function createQuestionDataPointsBox(data) {
     var textfield = $('<input />').attr('type', 'text').attr('id', 'points').change(function () {
          data.points = $(this).val();          
     });
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.points'))).append(textfield);
}

function createQuestionDataThemesBox(data) {
     return $('<p />').text('-- Teemat tähän --');
}

function createQuestionMetaBox(data) {
     return $('<div />').append(createQuestionMetaImagesBox(data)).append(createQuestionMetaCodesBox(data));
}

function createQuestionMetaImagesBox(data) {
     var image = $('<form />').attr('target','upload_frame').attr('action', "getBaseURL()+'image'").attr('enctype','multipart/form-data').attr('method','post').append(
         $('<input />').attr('id','image_question_image').attr('name','image[question_image]').attr('size','30').attr('type','file'),
         $('<input />').attr('id','question_number').attr('name','number').attr('type','hidden').val(data.number),
         $('<input />').attr('id','image_submit').attr('name','commit').attr('type','submit').attr('value', 'Lisää')
     )
     var return_frame = $('<iframe />').attr('id','upload_frame').attr('name','upload_frame').attr('style','display: none')


     //var code_form = $('<form />').attr('target','upload_frame').attr('action', "getBaseURL()+'image'").attr('enctype','multipart/form-data').attr('method','post').append("
     var code_image = $('<img />').attr('src','http://chart.apis.google.com/chart?cht=tx&chl=')
     var textfield = $('<input />').attr('type', 'text').attr('id', 'codesbox').keyup(function () {
          code_image.attr('src','http://chart.apis.google.com/chart?cht=tx&chl='+$(this).val())
     });

     return  $('<div />').append(image).append(return_frame).append(textfield).append(code_image);
}


function createQuestionMetaCodesBox(data) {
     return $('<div />').text("code");
}

function createExamQuestion(number) {
     return {
          "id": null,
          "codes": [],
          "images": [],
          "course_themes": [],
          "number": number,
          "description": "",
          "name": "",
          "points": 0
     };
}
function getBaseURL() {
    var url = location.href;  // entire url including querystring - also: window.location.href;
    var baseURL = url.substring(0, url.indexOf('/', 14));


    if (baseURL.indexOf('http://localhost') != -1) {
        // Base Url for localhost
        var url = location.href;  // window.location.href;
        var pathname = location.pathname;  // window.location.pathname;
        var index1 = url.indexOf(pathname);
        var index2 = url.indexOf("/", index1 + 1);
        var baseLocalUrl = url.substr(0, index2);

        return baseLocalUrl + "/";
    }
    else {
        // Root Url for domain name
        return baseURL + "/";
    }

}
