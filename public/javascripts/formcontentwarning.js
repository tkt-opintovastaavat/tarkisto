function formChange(){ 
     $(‘isChanged’).value=”1″;
}

window.onbeforeunload = confirmExit;

function confirmExit() { 
     if($F(‘isChanged’)==’1′)     return “Sinulla on tallentamattomia muutoksia, haluatko varmasti poistua?”;
}

// http://quintessens.wordpress.com/2007/10/18/warning-before-navigate-away-from-a-web-form-without-save/
