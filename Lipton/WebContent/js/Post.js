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

function like(postidx) {
	if (postidx == "") {
		alert("아이디를 입력해 주세요.")
	}
	
	var httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = function() {
		 if (httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
			if (httpRequest.responseText.trim() == 1) {
				document.getElementById("likebtn").setAttribute("style", "background-color:#FF9900")
				var btnText = document.getElementById("likebtn").innerText
				document.getElementById("likebtn").innerText = "좋아요 " + String(parseInt(btnText.split(" ")[1]) + 1)
			} else {
				document.getElementById("likebtn").setAttribute("style", "background-color:buttonface")
				var btnText = document.getElementById("likebtn").innerText
				document.getElementById("likebtn").innerText = "좋아요 " + String(parseInt(btnText.split(" ")[1]) - 1)
			}
		}
	}
	httpRequest.open("GET", "like_ajax.jsp?postidx=" + postidx, true)
	httpRequest.send()
}