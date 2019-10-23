function sendit(idx) {
	var frm = document.modpostForm
	if (frm.modpost.value == "") {
		alert("내용을 입력해 주세요")
		frm.modpost.focus()
		return
	}
	frm.submit()
}