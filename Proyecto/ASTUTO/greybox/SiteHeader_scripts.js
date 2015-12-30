var script_loaded = true;
var loading_scripts = false;
var load_timeout = 15000; //15 sec
function displayLoading() {
var div = document.createElement('div');
div.id = 'loading_div';
div.innerHTML = '<img src="static_core/images/indicator.gif" /><br />Loading scripts... Please wait.';
div.style.cssText = 'border: 1px solid #999; position: absolute; width: 300px; background-color: #eee; padding: 10px;';
var t;
if (document.documentElement && document.documentElement.scrollTop)
t = document.documentElement.scrollTop;
else if (document.body)
t = document.body.scrollTop;
var body = document.getElementsByTagName('body')[0];
div.style.left = (body.offsetWidth/2) - 150 + 'px';
div.style.top = (t + 100) + "px";
body.appendChild(div);
}
function hideLoading() {
var body = document.getElementsByTagName('body')[0];
body.removeChild(document.getElementById('loading_div'));
}
function onDemand(fn_str, srcs) {
return function() {
if(window.loading_scripts) {
return ;
}
window.loading_scripts = true;
displayLoading();
var args = arguments;
var current_time = 0;
var current_script;
var load_script = function() {
if(current_time >= load_timeout) {
alert("Could not load JavaScript: " + current_script);
return;
}
if(script_loaded == true) {
if(srcs.length != 0) {
script_loaded = false;
current_time = 0;
var head = document.getElementsByTagName("head")[0];
var script = document.createElement("script");
current_script = srcs.shift();
script.src = current_script;
head.appendChild(script);
}
else {
window.loading_scripts = false;
hideLoading();
return eval(fn_str + ".apply(window, args);");
}
}
current_time += 25;
window.setTimeout(load_script, 25);
}
load_script();
return false;
}
}
function getHostName() {
var left = PageOracle.getBaseURL().replace(/http:\/\/[^\/]*/, '') + '/';
return "http://" + window.location.host + left;
}
var p_ajs = getHostName()+'static_core/scripts/general/AJS.js';
var p_ajs_adapter = getHostName()+'static_core/scripts/general/AJS_adapter.js';
var p_ajs_fx = getHostName()+'static_core/scripts/general/AJS_fx.js';
var path_ajs = [p_ajs, p_ajs_adapter, p_ajs_fx];
var path_greybox = getHostName()+'static_core/greybox/gb_scripts.js';
GB_ROOT_DIR = getHostName() + "static_core/greybox/";
GB_show = onDemand("GB_show", path_ajs.concat(path_greybox));
GB_showFullScreen = onDemand("GB_showFullScreen", path_ajs.concat(path_greybox));
GB_showImage = onDemand("GB_showImage", path_ajs.concat(path_greybox));
function showLogin() {
var url = getHostName() + "users/showLogin";
GB_show("Login into the system", url, 250, 350);
return false;
}
function skKeys(e) {
if(!e)
e = window.event;
var target;
if(e.target)
target = e.target;
else if (e.srcElement) 
target = e.srcElement;
var nn = target.nodeName.toLowerCase();
if(nn == 'textarea' || nn == 'input')
return true;
e.key = e.keyCode ? e.keyCode : e.charCode;
if((e.key == 101 || e.key == 69 || e.key == 5) && e.ctrlKey) {
if(!PageOracle.isLoggedIn()) {
if(window.GB_CURRENT) {
return false;
}
showLogin();
}
else {
window.location = PageOracle.getBaseURL() + '/users/setLogout?id=' + PageOracle.getPageId();
}
}
}
if (document.attachEvent) {
document.attachEvent("onkeypress", skKeys);
}
else {
document.addEventListener('keypress', skKeys, false);
}
