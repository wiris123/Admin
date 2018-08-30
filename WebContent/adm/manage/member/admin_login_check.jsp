<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script>
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<script language="JavaScript" src="../../js/default.js"></script>
<script language="JavaScript" src="../../js/lib.js"></script>
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
<title>admin_login</title>
</head>
<script>
function loginCheck(frm){

	if(frm.id.value == ""){
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	if(frm.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		frm.passwd.focus();
		return false;
	}

	if(frm.secure_login != undefined) {
		if(!frm.secure_login.checked){
			frm.action = "login_process.jsp";
		}
	}
	
	if(frm.id.value.search(/\W|\s/g) > -1){
		alert("아이디에는 특수문자를 못넣어임마");
		frm.id.focus();
		return false;
	}
	
}


</script>
<body>
	<div class="container">
	<form action="loginCheck(this);" method="get">
	<table class="table table-bordered">
		<tr>
			<td>아이디 : <input type="text" name="id"/>	</td>
		</tr>
		<tr>
			<td>패스워드 : <input type="text" name="pass"/></td>
		</tr>
	</table>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
	<button class="btn btn-primary" onclick="location.href='logout.jsp'">로그아웃</button>
	</div>
</body>
</html>