function chgImage(a,b,msg){
a.src=b.src;
return chgBar(msg);
}
function chgBar(msg){
 window.status=msg;
 return true;
}
function goURL(go_url){
 window.location.replace(go_url);
}
