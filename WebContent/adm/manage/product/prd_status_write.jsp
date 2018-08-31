<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String mode = request.getParameter("mode");  
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입현황</title>
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
	$(function() {
		$( "#datepicker1" ).datepicker({
			dateFormat: 'yy-mm-dd',
				//yearSuffix: '년',
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				showMonthAfterYear: true // 년월 셀렉트 박스 위치 변경
				//altField: "#date", // 타겟 필드
				//minDate: '-0d', // 오늘 이전 날짜는 선택 못함
				
		});
	});
	$(function() {
		$( "#datepicker2" ).datepicker({
			dateFormat: 'yy-mm-dd',
				//yearSuffix: '년',
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
				changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
				showMonthAfterYear: true // 년월 셀렉트 박스 위치 변경
				//altField: "#date", // 타겟 필드
				//minDate: '-0d', // 오늘 이전 날짜는 선택 못함
				
		});
	});

	$(document).ready(function(){

	 if($.cookie("left_quick") == "close"){
		$('#Container_wrap').addClass('left_close'); 
	 }else{
		$('#Container_wrap').removeClass('left_close'); 

	 }
	});

	function leftBtn() {
		$('#Container_wrap').toggleClass('left_close');   
		if ($('#Container_wrap').hasClass('left_close')) {
			$.cookie('left_quick', 'close', { expires: 1, path: '/', domain: 'demohome.anywiz.co.kr', secure: false });
		}
		else {
			$.cookie('left_quick', 'open', { expires: 1, path: '/', domain: 'demohome.anywiz.co.kr', secure: false });			
		}
	}
	/* 월 납입액을 계산하는 ajax */
	/* function premPlus(rp)
	{
		$(function()
		{
			$.ajax
			({
				url:"rprem.jsp",
				type : "get",
				data : 
				{
					paytime : $('#payt').val(),
					instime : $('#inst').val(),
					rprem : $('#rp').val(),
					death : $('#death').val()
				},
				dataType : "html",
				contentType : "text/html; charset:utf-8",//post타입의 content타입 : application/x-www-form-urlencoded;charset=utf-8
				success:function(responseData)
				{
					alert("성공인데 시벌아 = "+responseData);
					$('#mp').html(responseData);		
				},
				error:function(errorData){
					alert("오류발생 : "+errorData.status+":"+errorData.statusText);
				}

			});	

		});
	} */

	//form 유효성 검사
	function formChk(f){
		if(f.term_name.value==""){
			alert("상품명을 입력하세요");
			f.term_name.focus();
			return false;
		}
		if(f.paytime.value==""){
			alert("납입기간을 선택하세요");
			f.paytime.focus();
			return false;
		}
		if(f.instime.value==""){
			alert("보험기간을 선택하세요");
			f.instime.focus();
			return false;
		}
		if(f.rprem.value==""){ 
			alert("위험할증률을 선택하세요");
			f.rprem.focus();
			return false;
		}
		if(f.deathben.value==""){ 
			alert("사망보험금을 선택하세요");
			f.deathben.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<!-- 헤드부분 -->
	<%@include file="../include/head.jsp"%>
	<!-- 레프트메뉴 -->
	<%@include file = "../include/product_left.jsp" %>
	</div><!-- //left_area// -->
	<div id="Container">
	<div id="location">HOME > 상품관리</div>
	<div id="S_contents">
		<h3>가입현황<span> 가입현황 관리페이지입니다.</span></h3> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
<form name="termfrm" action="./proc/status.jsp" method="post" onSubmit="return formChk(this)">
<!-- 	<input type="hidden" name="tmp">	
	<input type="hidden" name="relidx" value=""> -->
	<input type="hidden" name="instype" value="2"> 
	<input type="hidden" name="mode" value="<%=mode%>">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
		<tr>
			<th>회원아이디</th>
			<td colspan="3">
				<input name="id" type="text" value="" size="30" class="input">&nbsp;
			</td>
		</tr>
		<tr>
			<th>보험명</th>
			<td colspan="3">
				<input name="insname" type="text" value="2" size="1" class="input" readonly="readonly" style="border: 0">
			</td>
		</tr>
		<tr>
			<th>보험계약번호</th>
			<td colspan="3">
				<input type="text" name="insnum" />
			</td>
		</tr>
		<tr>
			<th>최종납입상황</th>
			<td colspan="3">
				<input type="text" name="remainpay" />
			</td>
		</tr>
		<tr>
			<th>납입한보험료</th>
			<td colspan="3">
				<input type="text" name="paidprem" />
			</td>
		</tr>
		<tr>
			<th>보험료</th>
			<td colspan="3">
				<input type="text" name="prem" />
			</td>
		</tr>
		<tr>
			<th>계약상태</th>
			<td colspan="3">
				<input type="radio" name="contstat" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="contstat" value='N'/> N &nbsp;&nbsp;&nbsp;
				<input type="radio" name="contstat" value='E'/> E
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="top10">
		<tr>
			<td align="center">
				<button style="border:0" type="submit" class="b h28 t5 color blue_big">확인</button>&nbsp;
				<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='prd_status_list.jsp?=mode="<%=mode %>"';">목록</button>
			</td>
		</tr>
	</table>
	</form>
	<!-- </div> -->
	</div><!-- //Container// -->
	</div><!-- //Container_wrap// -->

	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/product/prd_input.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:11:59 GMT -->
</html>