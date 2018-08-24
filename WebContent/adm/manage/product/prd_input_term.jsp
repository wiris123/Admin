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
	
	<h3>상품관리<span> 정기보험 관리페이지입니다.</span></h3>
<!--  enctype="multipart/form-data" return inputCheck(this);-->
<script>
/* 월 납입액을 계산하는 ajax */
function premPlus(rp)
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
}

</script>
	<form name="termfrm" action="./proc/input_term.jsp" method="post" onSubmit="">
<!-- 	<input type="hidden" name="tmp">
	<input type="hidden" name="mode" value="insert">
	<input type="hidden" name="relidx" value=""> -->
	<input type="hidden" name="instype" value="2"> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th>상품명</th>
		<td colspan="3">
			<input name="term_name" type="text" value="" size="60" class="input">&nbsp;
		</td>
	</tr>
	<tr>
		<th>보험종류</th>
		<td colspan="3">
			<input name="prdnum" type="text" value="2" size="30" class="input" readonly>
		</td>
	</tr>
	<tr>
		<th>납입기간</th>
		<td colspan="3">
			<select name="paytime" id="payt" value="">
				<option value="10">10년납</option>
				<option value="20">20년납</option>
				<option value="40">60세납</option>
				<option value="45">65세납</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>보험기간</th>
		<td colspan="3">
			<table border="0" cellspacing="5" cellpadding="0">
			<tr>
				<td colspan="2">
					<select name="instime" id="inst" value="">
						<option value="10">10년만기</option>
						<option value="20">20년만기</option>
						<option value="40">60세까지</option>
						<option value="50">70세까지</option>
					</select>
				</td>
			</tr>
			<!-- <tr>
				<td>1.</td>
				<td><input name="info_name1" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value1" type="text" value="" size="20" class="input"></td>
				<td width="60" align="right">6.</td>
				<td><input name="info_name6" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value6" type="text" value="" size="20" class="input"></td>
			</tr>
			<tr>
				<td>2.</td>
				<td><input name="info_name2" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value2" type="text" value="" size="20" class="input"></td>
				<td align="right">7.</td>
				<td><input name="info_name7" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value7" type="text" value="" size="20" class="input"></td>
			</tr>
			<tr>
				<td>3.</td>
				<td><input name="info_name3" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value3" type="text" value="" size="20" class="input"></td>
				<td align="right">8.</td>
				<td><input name="info_name8" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value8" type="text" value="" size="20" class="input"></td>
			</tr>
			<tr>
				<td>4.</td>
				<td><input name="info_name4" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value4" type="text" value="" size="20" class="input"></td>
				<td align="right">9.</td>
				<td><input name="info_name9" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value9" type="text" value="" size="20" class="input"></td>
			</tr>
			<tr>
				<td>5.</td>
				<td><input name="info_name5" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value5" type="text" value="" size="20" class="input"></td>
				<td align="right">10.</td>
				<td><input name="info_name10" type="text" value="" size="15" class="input"></td>
				<td><input name="info_value10" type="text" value="" size="20" class="input"></td>
			</tr> -->
			</table>
		</td>
	</tr>
	<tr>
		<th>위험할증률</th>
		<td colspan="3">
			<input type="text" name="rprem" id="rp" placeholder="1~10까지의 정수숫자"/>
	</td>
	</tr>
	<tr>
		<th>사망보험금</th>
		<td colspan="3">
			<select name="deathben" id="death" onChange="premPlus(this);">
				<option value="15000000">1억5천</option>
				<option value="10000000">1억</option>
				<option value="5000000">5천</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>월 납입액</th>
		<td colspan="3">
			<span id="mp"><input type="text" placeholder="사망보험금까지 선택하면 자동으로 계산"/></span>
	</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3">
			<input type="file" name="attfile"/>
	</td>
	</tr>
</table>
	<tr>
		<th height="25" >상품간단설명</th>
		<td colspan="3">
			<textarea name="shortexp" rows="5" cols="50" style="width:99%" class="textarea"></textarea>
		</td>
	</tr>
<!-- 	<tr>
		<th height="25" >상품상세정보</th>
		<td colspan="3">
			

// ---------------------------------------------------------------------------------
// outputBodyHTML 메서드를 호출하면 TEXTAREA 'fm_post' 폼 값에
// 에디터에서 입력한 내용이 자동으로 입력됩니다.
//
// outputBodyHTML:  BODY 태그 안쪽 내용을 가져옵니다.
// outputHTML:      HTML 문서 모두를 가져옵니다.
// outputBodyText:  BODY 태그 안쪽의 HTML 태그를 제외한 텍스트만을 가져옵니다.
// inputLength:     입력한 텍스트 문자 수를 리턴합니다.
// contentsLength:  BODY 태그 안쪽의 HTML 태그를 포함한 모든 문자 수를 리턴합니다.
// contentsLengthAll: HTML 문서의 모든 문자 수를 리턴합니다.


<script type="text/javascript" src="../../webedit/cheditor.js"></script>
<textarea id="content" name="content"></textarea>
에디터를 화면에 출력합니다.
<script type="text/javascript">
var content = new cheditor();             							// 에디터 개체를 생성합니다.
content.config.editorHeight = '300px';    // 에디터 세로폭입니다.
content.config.editorWidth = '100%';       	// 에디터 가로폭입니다.
content.inputForm = 'content';           				// textarea의 ID 이름입니다.
content.run();                            							// 에디터를 실행합니다.
</script>		</td>
	</tr>
 -->
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="top10">
	<tr>
		<td align="center">
			<button style="border:0" type="submit" class="b h28 t5 color blue_big">확인</button>&nbsp;
			<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='prd_list_term.jsp';">목록</button>
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