function sendit(){
	var frm = document.modForm
	if (frm.lastname.value == "") {
		alert("성을 입력해 주세요")
		return
	}
	if (frm.firstname.value == "") {
		alert("이름을 입력해 주세요")
		return
	}
	if (frm.pw0.value == "") {
		alert("기존 비밀번호를 입력해 주세요")
		return
	}
	if (frm.pw1.value == "") {
		alert("새 비밀번호를 입력해 주세요")
		return
	}
	if (frm.pw2.value == "") {
		alert("새 비밀번호를 다시 입력해 주세요")
		return
	}
	if (frm.pw1.value != frm.pw2.value) {
		alert("같은 비밀번호를 입력해 주세요")
		return
	}
	frm.submit()
}

function fileCheck(obj) {
    pathpoint = obj.value.lastIndexOf('.')
    filepoint = obj.value.substring(pathpoint+1,obj.length)
    filetype = filepoint.toLowerCase()
    if(!(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp')) {
		alert('이미지 파일만 선택할 수 있습니다.')
        parentObj  = obj.parentNode
        node = parentObj.replaceChild(obj.cloneNode(true),obj)
        return
    }
	if (obj.files && obj.files[0].size > (5 * 1024 * 1024)) {
	    alert("5MB 이하의 사진만 업로드 가능합니다");
	    obj.value = null;
	    return
	}
	var reader = new FileReader()
    reader.onload = function (e) {
        document.getElementById("imgLabel").setAttribute("style", "background-image:url('" + e.target.result + "')")
    }
    reader.readAsDataURL(obj.files[0])
}
