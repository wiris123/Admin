<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">


<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/member/member_input.php?mode=insert by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:13:55 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>홈페이지 관리자</title>
<link rel="stylesheet" href="../../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script>
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<link href="../wiz_style.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="../../js/default.js"></script>
<script language="JavaScript" src="../../js/lib.js"></script>

<style>
	.ui-datepicker { width: 242px; font-size:90%;}
	.ui-datepicker-calendar > tbody td:first-child a { 
	COLOR: #f00; 
	}
	.ui-datepicker-calendar > tbody td:last-child a { 
		COLOR: blue; 
	}
</style>
<script>

function writeValidate(f)
{
	 oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD",[]);
	 try{
		 f.submit();
	 }
	 catch(e){
	 
	 }
}


function mValidate(fn){
	//아이디검증
	if(fn.id.value==""){
		alert("아이디를 입력해주세요");
		fn.id.focus();
		return false;
	}
	if(fn.name.value==""){
		alert("이름을 입력해주세요");
		fn.name.focus();
		return false;
	}
	if(fn.pass.value==""){
		alert("패스워드을 4자 이상 12자 이내의 영문/숫자 조합으로 입력해주세요");
		fn.pass.focus();
		return false;
	}
	if(fn.email1.value==""){
		alert("이메일을 입력해주세요");
		fn.email1.focus();
		return false;
	}
	if(fn.birth1.value==""){
		alert("'생년일월' 을 입력해주세요");
		fn.birth1.focus();
		return false;
	}
	
	var frmArray = ["pass","mobile1","mobile2","mobile3"];
	var txtArray = ["패스워드","전화번호1","전화번호2","전화번호3"];
	for(var i=0 ; i<frmArray.length ; i++)
	{
		if(
			eval("fn."+ frmArray[i] +".type")=="text" ||
			eval("fn."+ frmArray[i] +".type")=="password"
		)
		{			
			if(eval("fn."+ frmArray[i] +".value")=="")
			{
				alert(txtArray[i] +"을(를) 입력하세요");
				eval("fn."+ frmArray[i] +".focus()");
				return false;
			}			
		}		
	}
	
}

function email_input(em, frm){
	//선택한 select의 값이 빈값이 아닐때만 동작
	if(em.value!=""){
		if(em.value=="1"){
			//직접입력 선택한 경우
			//readonly속성 해제
			frm.email2.readOnly = false;
			//도메인부분 비워주기
			frm.email2.value = "";
		}
		else{
			//도메인을 선택한 경우
			//선택한 도메인을 입력한다.
			frm.email2.value = em.value;
			//readonly속성을 활성화한다.
			frm.email2.readOnly = true;
		}
	}
} 
</script>
</head>
<body class="home_body">
<%@include file="../include/head.jsp" %>

<div id="location">HOME > 회원관리</div>
<div id="S_contents">
	<h3>상담회원관리<span>회원을 추가합니다.</span></h3>
		<form name="frm" action="memberQ_write_process.jsp" method="post"  onSubmit="return mValidate(this);">
			<table width="100%" >
				<tr>
					<td>
						<table class="table_basic">
							<tr>
								<th width="15%">아이디</th>
								<td width="35%"><input name="id" type="text" value="" class="input"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input name="name" type="text" value="" class="input"></td>
							</tr>
							
							<tr>
								<th>전화번호</th>
								<td colspan="3">
									<input type="text" name="mobile1" value="" size="3" class="input" >-<input type="text" name="mobile2" value="" size="4" class="input">-<input type="text" name="mobile3" value="" size="4" class="input">

								</td>

							</tr>
							
							<tr>
								<th class="text-center" style="vertical-align:middle;">내용</th>
								<td>
								<script type="text/javascript" src="./se2/workspace/js/service/HuskyEZCreator.js" charset="utf-8"></script>  
		
									<textarea name="contents" id="contents" rows="10" cols="300" style='width:100%;'>글내용</textarea>
		
									<script type="text/javascript">
										var oEditors = [];
										nhn.husky.EZCreator.createInIFrame({
										oAppRef: oEditors,
										elPlaceHolder: "contents",
										sSkinURI: "./se2/workspace/SmartEditor2Skin.html",
										
										fCreator: "createSEditor2"	
										});
										
									</script> 
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	
			<div class="center ">
				<button style="border:0" type="submit" class="b h28 t5 color blue_big">확인</button>&nbsp;
				<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='member_list.jsp';">목록</button>
			</div>
		</form>
	</div>

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>

