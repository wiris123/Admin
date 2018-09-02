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
	<h3>회원관리<span>회원을 추가합니다.</span></h3>
		<form name="frm" action="member_write_process.jsp" method="post"  onSubmit="return mValidate(this);">
			<table width="100%" >
				<tr>
					<td>
						<table class="table_basic">
							<tr>
								<th width="15%">아이디</th>
								<td width="35%"><input name="id" type="text" value="" class="input"></td>
							</tr>
							<tr>	
								<th width="15%">비밀번호</th>
								<td width="35%"><input name="pass" type="password" value="" class="input" ><span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
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
								<th>이메일</th>
								<td> 
									<input type="text" name="email1"  value="" /> @ 
									<input type="text" name="email2"  value="" readonly />
										<select name="last_email_check2" onChange="email_input(this,this.form);" class="pass" id="last_email_check2" >
											<option selected="" value="">선택해주세요</option>
											<option value="1" >직접입력</option>
											<option value="dreamwiz.com" >dreamwiz.com</option>
											<option value="empal.com" >empal.com</option>
											<option value="empas.com" >empas.com</option>
											<option value="freechal.com" >freechal.com</option>
											<option value="hanafos.com" >hanafos.com</option>
											<option value="hanmail.net" >hanmail.net</option>
											<option value="hotmail.com" >hotmail.com</option>
											<option value="intizen.com" >intizen.com</option>
											<option value="korea.com" >korea.com</option>
											<option value="kornet.net" >kornet.net</option>
											<option value="msn.co.kr" >msn.co.kr</option>
											<option value="nate.com" >nate.com</option>
											<option value="naver.com" >naver.com</option>
											<option value="netian.com" >netian.com</option>
											<option value="orgio.co.kr" >orgio.co.kr</option>
											<option value="paran.com" >paran.com</option>
											<option value="sayclub.com" >sayclub.com</option>
											<option value="yahoo.co.kr" >yahoo.co.kr</option>
											<option value="yahoo.com" >yahoo.com</option>
										</select>
								</td>
							</tr>
							<tr>
				    			<th>생일 </th>
							    <td><input name="birth1" type="text">년
								    <select name="birth2">
									   <option value="01">01</option>
									   <option value="02">02</option>
									   <option value="03">03</option>
									   <option value="04">04</option>
									   <option value="05">05</option>
									   <option value="06">06</option>
									   <option value="07">07</option>
									   <option value="08">08</option>
								       <option value="09">09</option>
									   <option value="10">10</option>
									   <option value="11">11</option>
									   <option value="12">12</option>	
									</select>월
									<select name="birth3">
									   <option value="01">01</option>
									   <option value="02">02</option>
									   <option value="03">03</option>
									   <option value="04">04</option>
									   <option value="05">05</option>
									   <option value="06">06</option>
									   <option value="07">07</option>
									   <option value="08">08</option>
									   <option value="09">09</option>
									   <option value="10">10</option>
									   <option value="11">11</option>
									   <option value="12">12</option>	
									   <option value="13">13</option>
									   <option value="14">14</option>
									   <option value="15">15</option>
									   <option value="16">16</option>
									   <option value="17">17</option>
									   <option value="18">18</option>
									   <option value="19">19</option>
									   <option value="20">20</option>
									   <option value="21">21</option>
									   <option value="22">22</option>
									   <option value="23">23</option>
									   <option value="24">24</option>
									   <option value="25">25</option>
									   <option value="26">26</option>
									   <option value="27">27</option>
									   <option value="28">28</option>
									   <option value="29">29</option>
									   <option value="30">30</option>
									   <option value="31">31</option>
									</select>일
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

