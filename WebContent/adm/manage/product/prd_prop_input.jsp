<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록</title>
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

	function formChk(f){
		if(f.prop_name.value==""){
			alert("상품명을 입력하세요");
			f.prop_name.focus();
			return false;
		}
	}
	
	
	$(function()
		{
			$.ajax
			({
				url:"proPrem.jsp",
				type : "get",
				data : 
				{
					paytime : $('#payt').val(),
					payment : $('#paym').val,
					instart : $('#instart').val(),
					regidate : $('#regidate').val(),
					rprem : $('#rp').val(),
					death : $('#death').val()
				},
				dataType : "html",
				contentType : "text/html; charset:utf-8",//post타입의 content타입 : application/x-www-form-urlencoded;charset=utf-8
				success:function(responseData)
				{
					alert("성공인데 시벌아 = "+responseData);
					$('#result').html(responseData);		
				},
				error:function(errorData){
					alert("오류발생 : "+errorData.status+":"+errorData.statusText);
				}
	
			});	
	
		});
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

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="setClass01();setCategory();prdlayCheck();lodingComplete();prdFocus();">

<div id="location">HOME > 상품관리</div>
<div id="S_contents">
	
	<h3>상품관리<span> 실손보험 관리페이지입니다.</span></h3>

	<form name="propfrm" action="./proc/input_prop.jsp" method="post" onSubmit="return formChk(this)">
	<!-- <input type="hidden" name="tmp">
	<input type="hidden" name="mode" value="insert">
	<input type="hidden" name="relidx" value=""> -->
	<input type="hidden" name="instype" value="3">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
		<tr>
			<th>상품명</th>
			<td colspan="3">
				<input name="prop_name" type="text" value="" size="30" class="input">&nbsp;
			</td>
		</tr>
		<tr>
			<th>보험종류</th>
			<td colspan="3">
				<input name="instype" type="text" value="3"  class="input" readonly="readonly" style="border: 0">
			</td>
		</tr>
		<tr>
			<th>보험기간</th>
			<td colspan="3">
				<table border="0" cellspacing="0" cellpadding="0">
					<td colspan="2">
						<select name="instime" id="">
							<option value="10">10년만기</option>
							<option value="20">20년만기</option>
							<option value="60">60세까지</option>
							<option value="70">70세까지</option>
						</select>
						</table>
			</td>
		</tr>
		<tr>
			<th>월 납입액</th> 
			<td colspan="3">
				<input type="number" min="10" max="40" value="10" name="monthpay" />
				<b style="font-size: 10; color: #D5D5D5">납입액은 10만원부터 40만원 까지 가능합니다.</b>
			</td>	
		</tr>
		<tr>
			<th>질병입원보장</th>
			<td colspan="3">
				<input type="radio" name="hosp" checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="hosp" value="N"/> N
		</td>
		</tr>
		<tr>
			<th>질병통원보장</th>
			<td colspan="3">
				<input type="radio" name="gohosp" checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gohosp" value="N"/> N
		</td>
		</tr>
		<tr>
			<th>상해입원보장</th>
			<td colspan="3">
				<input type="radio" name="sanghosp" checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="sanghosp" value="N"/> N
		</td>
		</tr>
		<tr>
			<th>상해통원보장</th>
			<td colspan="3">
				<input type="radio" name="sgohosp" checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="sgohosp" value="N"/> N
		</td>
		</tr>
		<tr>
			<th>비급여도수</th>
			<td colspan="3">
				<input type="radio" name="chbedosu"  checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="chedosu" value="N"/> N
		</td> 
		</tr>
		<tr>
			<th>체외충격파</th>
			<td colspan="3">
				<input type="radio" name="chbeinje" checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="chbeinje" value="N"/> N
		</td>
		</tr>
		<tr>
			<th>자기공명진단</th>
			<td colspan="3">
				<input type="radio" name="chbemri" checked="checked" value="Y"/> Y &nbsp;&nbsp;&nbsp;
				<input type="radio" name="chbemri"  value="N"/> N
		</td>
		</tr>
		
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
				<input type="file" name="attfile"/>
			</td>
		</tr>
	<br/>
		<tr>
			<th height="25" >상품간단설명</th>
			<td colspan="3">
				<textarea name="shortexp" rows="5" cols="50" style="width:99%" class="textarea"></textarea>
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="top10">
	<tr>
		<td align="center">
			<button style="border:0" type="submit" class="b h28 t5 color blue_big">확인</button>&nbsp;
			<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='prd_list_prop.jsp';">목록</button>
		</td>
	</tr>
	</table>
	</form>

	</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/product/prd_input.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:11:59 GMT -->
</html>