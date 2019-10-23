function sendit() {
	var frm1 = document.replyForm
	if (frm1.reply.value == "") {
		alert("댓글을 입력해 주세요")
		return
	}
	frm1.submit()
}

function delReply() {
	var frm2 = document.delreplyForm
	if (confirm("댓글을 삭제하시겠습니까?")) {
		frm2.submit()
	}
}