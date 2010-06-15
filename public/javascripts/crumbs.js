/*
Copyright Justin Whitford 2006.
  http://www.whitford.id.au/
Perpetual, non-exclusive license to use this code is granted
on the condition that this notice is left in tact.

Modified by tarkisto-dev 2010. No extra requirements for using this.
*/

var delim = " ... ";
var titleDelim = " :: ";
var nameOfTestCookie = "tarkistoTest";
var nameOfLinksCookie = "tarkistoLinks";
var nameOfTitlesCookie = "tarkistoTitles";
var trailLength = 5;
var chunks;
var HOUR = 60 * 60 * 1000;

function doCrumbs(){
     if (cookieTest(nameOfTestCookie)) {
          var crumbList = new CrumbList();
          if (getCookie(nameOfLinksCookie)) {
               var staleLinkCrumbs = getCookie(nameOfLinksCookie).split(delim);
               var staleTextCrumbs = getCookie(nameOfTitlesCookie).split(delim);
               var startPos = (staleTextCrumbs.length < trailLength ||
                    document.location==staleLinkCrumbs[staleLinkCrumbs.length-1])
                    ?0:1;
               for (i = startPos; i < staleLinkCrumbs.length; i++) {
                    crumbList.add(staleLinkCrumbs[i],staleTextCrumbs[i]);
               }
          }
          if (document.location != crumbList.links[crumbList.links.length-1]) {
               crumbList.add(document.location, parseCorrectTitle());
          }
          setCookie(nameOfLinksCookie, crumbList.links.join(delim),1);
          setCookie(nameOfTitlesCookie, crumbList.text.join(delim),1);
          crumbList.output();
     }
}

function parseCorrectTitle() {
     var titleArr = document.title.split(titleDelim);
     if (titleArr.length > 2)
          return titleArr[titleArr.length-1] + " (" + titleArr[titleArr.length-2] + ")";
     else
          return titleArr[titleArr.length-1];
}


function CrumbList(){
     this.links=new Array();
     this.text=new Array();
     this.add = crumbListAdd;
     this.output = crumbListShow;
}

     function crumbListAdd(href,text){
          this.links[this.links.length]=href;
          this.text[this.text.length]=text;
     }

     function crumbListShow(){
          for (var i in this.links) {
               if (i == this.links.length-1) {
                    document.write( ((i == 0) ? "" : delim) + this.text[i] );
               } else {
               document.write(
                    ((i==0) ? "" : delim)
                    +"<a href='" + this.links[i] + "'>"
                    + this.text[i] + "</a>"
               );
               }
          }
     }


function cookieTest(name){
     try {
          setCookie(name,'true',1);
          chunks = document.cookie.split("; ");
          return (getCookie(name)=='true');
     } catch(e) {
          return false;
     }
}

function getCookie(name) {
     var returnVal = null;
     for (var i in chunks) {
          var chunk = chunks[i].split("=");
          returnVal = (chunk[0] == name) ? unescape(chunk[1]) : returnVal;
     }
     return returnVal;
}

function setCookie(name, value, hours) {
     if (value != null && value != "" && hours > 0) {
          var expiry = new Date(new Date().getTime() + hours * HOUR);
          document.cookie = name +"="+ escape(value)
                          + "; expires=" + expiry.toGMTString()
                          + "; path=/";
          chunks = document.cookie.split("; ");
     }
}
