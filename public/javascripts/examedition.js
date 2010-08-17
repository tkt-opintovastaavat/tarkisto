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

     addExistingQuestions($tabs);

     $('a[href="#new_question"]').unbind().live('click', function(event) {
          event.preventDefault();
          var question = createExamQuestion(lastQuestionId+1);
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
     $('#save form').submit(saveDataObject);
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
          dataObject.modified = true;
     });
     if (data.name != null) {
          $(textarea).val(data.name);
     }
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.name'))).append(textarea);
}

function createQuestionDataDescriptionBox(data) {
     var textarea = $('<textarea />').addClass('question-content').attr('id', 'question_description').change(function () {
          data.description = $(this).val();
          dataObject.modified = true;
     });
     if (data.description != null) {
          $(textarea).val(data.description);
     }
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.description'))).append(textarea);
}

function createQuestionDataPointsBox(data) {
     var textfield = $('<input />').attr('type', 'text').attr('id', 'points').change(function () {
          data.points = $(this).val();          
          dataObject.modified = true;
     });
     if (data.points != null) {
          $(textfield).val(data.points);
     }
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.points'))).append(textfield);
}

function createQuestionDataThemesBox(data) {
     var dropdown_selection = $('<select />').attr('multiple','multiple').attr('id','course_themes').attr('name','course_theme_selection')
     $.each(dataObject.themes, function(i, theme) {
          theme = ($.parseJSON(theme)).theme;
          dropdown_selection.append(
               $('<option />').attr('value', theme.id).text(theme.name_fi)
          );
     });
     dropdown_selection.change(function() {
          data.course_themes = $.parseJSON('['+$(this).val()+']')
          dataObject.modified = true;
     });
     return $('<p />').append(dropdown_selection);
     
}

function createQuestionMetaBox(data) {
     return $('<div />').append(createQuestionMetaImagesBox(data)).append(createQuestionMetaCodesBox(data));
}

function createQuestionMetaImagesBox(data) {
     var open_image_dialog = $('<p />').append(
          $('<button />').text('Lisää kuvatiedosto').click(function(event) {
               createImageDialog(data).dialog('open');
          })
     );
     

     var open_formula_dialog = $('<p />').append(
          $('<button />').text('Lisää LaTeX-kaava').click(function(event) {
               createFormulaDialog(data).dialog('open');
          })
     );
     return  $('<div />').append(open_image_dialog).append(open_formula_dialog);
}

function createImageDialog(data) {
     var image = $('<form />').attr('target','upload_frame').attr('action', Routes.generate({controller: 'image', action: ''})).attr('enctype','multipart/form-data').attr('method','post').append(
         $('<input />').attr('id','image_question_image').attr('name','image[question_image]').attr('size','30').attr('type','file'),
         $('<input />').attr('id','question_number').attr('name','number').attr('type','hidden').val(data.number)
     ).dialog({
          autoOpen: false,
          resizable: false,
          draggable: false,
          width: 'auto',
          height: 'auto',
          modal: true,
          closeOnEscape: false,
          title: "Lisää kuvatiedosto",
          buttons: {
               submit: function() {
                    $(this).submit();
                    $(this).dialog('close');
               },
               close: function() {
                    $(this).dialog('close');
               }
          }
     });
     var return_frame = $('<iframe />').attr('id','upload_frame').attr('name','upload_frame').attr('style','display: none')

     image.append(return_frame)
     return image
}

function createFormulaDialog(data) {
     var code_image = $('<p />').append(
          $('<img />').attr('src','http://chart.apis.google.com/chart?cht=tx&chl=')
     );
     var textfield = $('<p />').append(
          $('<input />').attr('type', 'text').change(function () {
               $('img', code_image).attr('src','http://chart.apis.google.com/chart?cht=tx&chl='+$(this).val())
          })
     );

     return $('<form />').append(textfield).append(code_image).dialog({
          autoOpen: false,
          resizable: false,
          draggable: false,
          modal: true,
          closeOnEscape: false,
          buttons: {
               create: function() {
                    var formula = $('input', this).val();
                    var dialog = $(this);
                    $.post(Routes.generate({controller: 'image', action: 'formula.json'}), {'formula': formula}, function(jsondata) {
                         data['images'].push(jsondata.id);
                         dataObject.modified = true;
                         dialog.dialog('close');
                    }, 'json');
               },
               close: function() {
                    $(this).dialog('close');
               }
          }
     });
}

function createQuestionMetaCodesBox(data) {
     var open_code_dialog = $('<p />').append(
          $('<button />').text('Lisää koodia').click(function(event) {
               createCodeDialog(data).dialog('open');
          })
     );
     return $('<div />').append(open_code_dialog);
}
function createCodeDialog(data) {
     var codebox = $('<textarea />').attr('id','codebox').attr('cols','100').attr('rows','20');

     return $('<form />').append(codebox).dialog({
          autoOpen: false,
          resizable: false,
          draggable: false,
          width: 'auto',
          height: 'auto',
          modal: true,
          closeOnEscape: false,
          title: "Lisää koodia",
          buttons: {
               submit: function() {
                    var code = $('textarea', this).val();
                    var dialog = $(this);
                    $.post(Routes.generate({controller: 'code', action: ''}), {'code': code}, function(jsondata) {
                         data['codes'].push(jsondata.id);
                         dataObject.modified = true;
                         dialog.dialog('close');
                    }, 'json');
               },
               close: function() {
                    $(this).dialog('close');
               }
          }
     });
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

function saveDataObject(event){
     event.preventDefault();
     $.post($(this).attr("action"), dataObject, function(data) {
          alert("Save successful")
     });
}

function addExistingQuestions($tabs) {
     $.each(dataObject.questions, function(i, data) {
          $(createQuestionBox(data)).appendTo('#questions');
          $tabs.tabs('add', '#questions-' + lastQuestionId, I18n.t('pages.exams.forms.questions.anon'));
          lastQuestionId++;
     });
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
