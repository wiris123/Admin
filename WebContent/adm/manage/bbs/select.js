//전체선택
function selectAll(obj, topcheckbox) {
	var chkObj = document.getElementsByName("select_chkbox");
	var rowCnt = chkObj.length - 1;
	// 대가리에 노드를 체크로 전환시
	if (topcheckbox.checked == true) {
		// 전부 선택으로 바꿔줌
		for (var i = 0; i <= rowCnt; i++) {
			chkObj[i].checked = true;
		}
		// 체크 해제시
	} else {
		// 전부 체크 해제
		for (var i = 0; i <= rowCnt; i++) {
			chkObj[i].checked = false;
		}
	}
}

// 선택삭제
function selDelete() {
	var selvalue = document.getElementsByName("select_chkbox")
	var url_string = window.location.href;
	var url = new URL(url_string);
	var b_id = url.searchParams.get("b_id");
	var name=null;
	//한번 for문으로 훑어서 체크된값이 있다면 name 에 저장
	for (var i = 0; i <= selvalue.length - 1; i++) {
		if (selvalue[i].checked) {
			if(name==null) name=selvalue[i].value;
			else name +=  '-' + selvalue[i].value;
		}
	}
	//없었다면
	if (name == null) {
		alert("삭제할 상품을 선택하세요.");
		return false;
	} 
	//있다면 다시한번 삭제할것인지 확인
	else 
	{
		if (confirm("선택한 상품을 정말 삭제하시겠습니까?")) {
			document.location = "./proc/bbs_del_proc.jsp?prop_name=" +name+"&b_id="+b_id
		}
	}
}

function bbsCheck(frm) {

	if (frm.name.value == "") {
		alert("작성자를 입력하세요.");
		frm.name.focus();
		return false;
	}

	if (frm.title.value == "") {
		alert("제목을 입력하세요.");
		frm.title.focus();
		return false;
	}
	try {
		content.outputBodyHTML();
	} catch (e) {
	}
	if (frm.contents.value == "") {
		alert("내용을 입력하세요.");
		return false;
	}
	if (frm.vcode != undefined
			&& (hex_md5(frm.vcode.value) != md5_norobot_key)) {
		alert("자동등록방지코드를 정확히 입력해주세요.");
		frm.vcode.focus();
		return false;
	}

}
