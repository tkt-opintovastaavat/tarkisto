/*
 * Application specific javascripts.
 */

$(function() {
  Nifty("div#box","big");
});

$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
});

