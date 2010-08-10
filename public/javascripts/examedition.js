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
          $(createQuestionBox()).appendTo('#questions');
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
     var textarea = $('<textarea />').addClass('question-name').attr('id', 'question_name');
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.name'))).append(textarea);
}

function createQuestionDataDescriptionBox(data) {
     var textarea = $('<textarea />').addClass('question-content').attr('id', 'question_description');
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.description'))).append(textarea);
}

function createQuestionDataPointsBox(data) {
     var textfield = $('<input />').attr('type', 'text').attr('id', 'points');
     return $('<p />').append($('<label />').text(I18n.t('pages.exams.forms.questions.points'))).append(textfield);
}

function createQuestionDataThemesBox(data) {
     return $('<p />').text('-- Teemat tähän --');
}

function createQuestionMetaBox(data) {
     return $('<div />').append(createQuestionMetaImagesBox(data)).append(createQuestionMetaCodesBox(data));
}

function createQuestionMetaImagesBox(data) {
     return $('<div />').text('image');
}

function createQuestionMetaCodesBox(data) {
     return $('<div />').text('code');
}
