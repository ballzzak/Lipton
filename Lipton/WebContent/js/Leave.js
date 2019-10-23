function sendit() {
	var frm = document.leaveForm;
	if (frm.pw.value == "") {
		alert("패스워드를 입력해 주세요")
		return
	}
	if (confirm("정말 탈퇴하시겠습니까?")) frm.submit()
}