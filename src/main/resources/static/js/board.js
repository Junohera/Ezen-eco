var num_now = 2;
var now = 0;
function pBoxOX() {
	var mode = "<c:out value='${fn:length(bundleList)}'/>";
	alert(mode);
	if (now == 0) {
		document.getElementById("playListBox").style.display = "block";
		now = 1;
	} else if (now == 1) {
		document.getElementById("playListBox").style.display = "none";
		now = 0;
	}
}
function pBoxX() {
	document.getElementById("playListBox").style.display = "none";
	now = 0;
}
function move(x) {
	if (x == 1) {
		document.getElementById("recommendBoxRo").style.transform = "translateX(" + (0) + "px)";
	} else if (x == 2) {
		document.getElementById("recommendBoxRo").style.transform = "translateX(" + (-950) + "px)";
	}
}

function allSearch(f) {
	allSearchform.submit();
}











