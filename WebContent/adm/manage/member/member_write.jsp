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

</head>
<body class="home_body">
<%@include file="../include/head.jsp" %>
    
<script src="../../../../dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script language="javascript">

function inputCheck(frm){

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
		
}


</script>
<div id="location">HOME > 회원관리</div>
<div id="S_contents">
	<h3>회원관리<span>회원을 추가합니다.</span></h3>
	<form name="frm" action="member_write_process.jsp" method="post"  onSubmit="return inputCheck(this);">
	<input type="hidden" name="tmp">
	<input type="hidden" name="mode" value="insert">
	<input type="hidden" name="idx" value="">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
			<tr>
				<th width="15%">아이디</th>
				<td width="35%">
					<input name="id" type="text" value="" class="input" >
										<button type="button" class="h18 t3 color small round black_s" onCLick="idCheck()">중복체크</button>
									</td>
				<th width="15%">비밀번호</th>
				<td width="35%"><input name="pass" type="text" value="" class="input"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input name="name" type="text" value="" class="input"></td>
				
			</tr>

						<tr>
				<th>전화번호</th>
				<td colspan="3">
										<input type="text" name="mobile" value="" size="5" class="input">
				</td>
			</tr>
			
						<tr>
				<th>이메일</th>
				<td colspan="3">
					<input name="email" type="text" value="" size="40" class="input">
				</td>
			</tr>
			<tr>
    
    <th>생일 </th>
    <td><input name="birth" type="text">년
	<select name="월">
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
           <option value="9">9</option>
	   <option value="10">10</option>
	   <option value="11">11</option>
	   <option value="12">12</option>	
        </select>월
	<select name="일">
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
	   <option value="9">9</option>
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

	<div class="center top10">
		<button style="border:0" type="submit" class="b h28 t5 color blue_big">확인</button>&nbsp;
		<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='member_list.jsp';">목록</button>
	</div>
	</form>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/member/member_input.php?mode=insert by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:13:56 GMT -->
</html>

