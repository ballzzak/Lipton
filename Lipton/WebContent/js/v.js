function v() {
	var d = document.getElementById("infodiv")
	if (d.getAttribute("style") == "display:none") {
		d.setAttribute("style","display:block")
	} else {
		d.setAttribute("style","display:none")
	}
}