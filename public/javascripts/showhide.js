function showhide(obj) {
     var el = document.getElementById(obj);
     if ( el.style.display != 'none' ) {
          el.style.display = 'none';
     }
     
     else {
          el.style.display = '';
     }
}

function collapseAll(objs) {
     var i;
     for (i=0;i<objs.length;i++ ) {
          objs[i].style.display = 'none';
     }
}


function pageLoad() {
     collapseAll($('course','repeat','separate'));
}