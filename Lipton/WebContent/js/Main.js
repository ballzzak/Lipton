function sendit1() {
	var frm1 = document.LoginForm
	if(frm1.userid.value == ""){
		alert("아이디를 입력해 주세요")
		frm1.m_userid.focus()
		return false
	}
	if(frm1.pw.value == ""){
		alert("패스워드를 입력해 주세요")
		frm1.m_pwd.focus()
		return false
	}
	frm1.submit()
}

function sendit2(){
	var frm2 = document.regForm
	if (frm2.lastname.value == "") {
		alert("성을 입력해 주세요")
		return
	}
	if (frm2.firstname.value == "") {
		alert("이름을 입력해 주세요")
		return
	}
	if (frm2.userid.value == "") {
		alert("휴대폰 번호 또는 이메일을 입력해 주세요")
		return
	}
	if (frm2.pw.value == "") {
		alert("비밀번호를 입력해 주세요")
		return
	}
	frm2.submit()
}

function sendit3(){
	var frm3 = document.postForm
	if (frm3.post.value == "") {
		alert("글을 입력해 주세요")
		return
	}
	frm3.submit()
}