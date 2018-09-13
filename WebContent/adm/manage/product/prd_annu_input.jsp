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
<!-- <script src="../../js/highcharts.js"></script> -->
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

//form 유효성 검사
function formChk(f)
{
	if(f.ann_name.value==""){
		alert("상품명을 입력하세요");
		f.ann_name.focus();
		return false;
	}
	if(f.instart.value==""){
		alert("연금게시일을 입력하세요");
		f.instart.focus();
		return false;
	}
	if(f.paytime.value==""){
		alert("연금납부연한을 입력하세요");
		f.paytime.focus();
		return false;
	}

	if(f.instart.value=="" ){
		alert("연금개시나이를 입력하세요");
		f.paytime.focus();
		return false;
	}
	if(f.instart.value<=80 || f.instart.value>=50 || !isNumber(f.instart.value)){
		alert("연금개시나이를 바르게 입력하세요");
		f.paytime.focus();
		return false;
	}
	if(f.payment.value==""){
		alert("월납입액을 입력하세요");
		f.payment.focus();
		return false;
	}
	if(f.rprem.value==""){ 
		alert("위험할증률을 선택하세요");
		f.rprem.focus();
		return false;
	}
	if(f.regidate.value==""){ 
		alert("계약일자를 입력하세요");
		f.regidate.focus();
		return false;
	}
}


function premPlus()
{
	$(function()
	{
			$.ajax
			({
				url:"annuPrem.jsp",
				type : "get",
				data : 
				{
					payment : $('#paym').val(),
					interest : $('#inter').val(),
					rprem : $('#rp').val(),
					paytime : $('#payt').val()
				},
				dataType : "json",
				contentType : "text/html; charset:utf-8",//post타입의 content타입 : application/x-www-form-urlencoded;charset=utf-8
				success:function(resp)
				{	//성공 시 월납입액, 납부연한에 값 입력
					alert("resp"+resp);
					$('#monthp').val(resp.result);		
					$('#payt').val(resp.payt);
				},
				error:function(errorData){
					
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
<div id="location">HOME > 상품관리</div>
<div id="S_contents">
		<div id="location">HOME > 상품관리</div>
		<div id="S_contents">
	<h3>상품관리<span> 연금보험 관리페이지입니다.</span></h3>

	<form name="annufrm" action="./proc/input_annu.jsp" method="post" onSubmit="return formChk(this)">
	<!-- <input type="hidden" name="tmp">
	<input type="hidden" name="mode" value="insert">
	<input type="hidden" name="relidx" value=""> -->
	<input type="hidden" name="instype" value="1">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th>상품명</th>
		<td colspan="3">
			<input name="ann_name" type="text" value="" size="30" class="input">&nbsp;
		</td>
	</tr>
	<tr>
		<th>보험종류</th>
		<td colspan="3">
			<input name="instype" type="text" value="1" size="30" class="input" style="border: 0"readonly>
		</td>
	</tr>
	<!-- <tr>
		<th>연금개시일</th>
		<td colspan="3">
			<input name="instart" id="datepicker1" type="text" value="" size="30" class="instart">
		</td>
	</tr> -->
	<tr>
		<th>연금납부연한</th>
		<td colspan="3">
			<input name="paytime" type="text" value="" id="payt" size="30" class="input" maxlength="2"/>
		</td>
	</tr>
	<tr>
		<th>연금개시나이</th>
		<td colspan="3">
			<input name="instart" type="text" value="" id="payt" size="30" class="input" maxlength="2"/>
		</td>
	</tr>
	<tr>
		<th>월 납입액</th>
		<td colspan="3">
			<input type="number" min="10" max="40" value="10" name="payment" id="paym"/>
			<b style="font-size: 10; color: #D5D5D5">납입액은 10만원부터 40만원 까지 가능합니다.</b>
	</td>
	</tr>
	<tr>
		<th>위험할증률</th>
		<td colspan="3">
			<select name="rprem" id="rp" value="" onChange="premPlus();">
				<option value="">==선택==</option>
				<%for(int i=0; i<=10; i++){ %>
				<option value="<%=i%>"><%=i %></option>
				<%} %>	
			</select>
	</td>
	<tr>
		<th>보장수익률</th>
		<td colspan="3">
			<select name="interest" id="inter" onChange="premPlus();">
				<option value="">==선택==</option>
				<%for(int i=0; i<=10; i++){ %>
				<option value="<%=i%>"><%=i %></option>
				<%} %>	
			</select>
	</td>
	<tr>
		<th>매월 연금수령액</th>
		<td colspan="3">
			<span id="result"><input type="text" name="monthann" value="" id="monthp" placeholder="자동으로 계산" style="border: 0" readonly/></span>
	</td>
<!-- 	<tr>
		<th>계약일자</th>
		<td colspan="3">
			<input type="text" size="30" name="regidate" id="datepicker2" value="" class="regidate"/>
	</td> -->
	<tr>
		<th>계약상태</th>
		<td colspan="3">
			<input type="radio" value="Y" name="submit" checked="checked"/> Y &nbsp;&nbsp;&nbsp;
			<input type="radio" value="N" name="submit"/> N &nbsp;&nbsp;&nbsp;
			<input type="radio" value="E" name="submit"/> E
		</td>
	</tr>
		<th>첨부파일</th>
		<td colspan="3">
			<input type="file" name="attfile"/>
		</td>
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
			<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='prd_list_annu.jsp';">목록</button>
		</td>
	</tr>
	</table>
	</form>
	</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>