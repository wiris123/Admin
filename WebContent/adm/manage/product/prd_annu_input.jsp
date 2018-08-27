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

//form 유효성 검사
function formChk(f){
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

$(function()
	{
		$.ajax
		({
			url:"annuPrem.jsp",
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
			<input name="instype" type="text" value="1" size="30" class="input" readonly="readonly" style="border: 0">
		</td>
	</tr>
	<tr>
		<th>연금개시일</th>
		<td colspan="3">
			<input name="instart" id="datepicker1" id="instart" type="text" value="" size="30" class="input">
		</td>
	</tr>
	<tr>
		<th>연금납부연한</th>
		<td colspan="3">
			<input name="paytime" type="text" value="" id="payt" size="30" class="input" />
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
			<select name="rprem" id="">
				<option value="">==선택==</option>
				<%for(int i=0; i<=10; i++){ %>
				<option value="<%=i%>"><%=i %></option>
				<%} %>	
			</select>
	</td>
	<tr>
		<th>보장수익률</th>
		<td colspan="3">
			<select name="interest" id="">
				<option value="">==선택==</option>
				<%for(int i=0; i<=10; i++){ %>
				<option value="<%=i%>"><%=i %></option>
				<%} %>	
			</select>
	</td>
	<tr>
		<th>매월 연금수령액</th>
		<td colspan="3">
			<span id="result"><input type="text" name="monthann" value="" id="monthp" placeholder="자동으로 계산" style="border: 0"/></span>
	</td>
	<tr>
		<th>계약일자</th>
		<td colspan="3">
			<input type="text" size="30" name="regidate" id="regidate" id="datepicker1" value="" />
	</td>
	<tr>
		<th>계약상태</th>
		<td colspan="3">
			<input type="radio" value="Y" name="submit" checked="checked"/> Y &nbsp;&nbsp;&nbsp;
			<input type="radio" value="N" name="submit"/> N &nbsp;&nbsp;&nbsp;
			<input type="radio" value="E" name="submit"/> E
		</td>
	</tr>
<<<<<<< HEAD
=======
		
	<tr>
>>>>>>> branch 'underwearRun' of https://github.com/wiris123/Admin
		<th>첨부파일</th>
		<td colspan="3">
			<input type="file" name="attfile"/>
<<<<<<< HEAD
	</td>
	</tr>
			</table>
		</td>
=======
		</td>
	</tr>
</table>
>>>>>>> branch 'underwearRun' of https://github.com/wiris123/Admin
	<br/>
	<tr>
		<th height="25" >상품간단설명</th>
		<td colspan="3">
			<textarea name="shortexp" rows="5" cols="50" style="width:99%" class="textarea"></textarea>
		</td>
	</tr>
<!-- 	<tr>
		<th height="25" >상품상세정보</th>
		<td colspan="3">
<ㄹ		

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

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/product/prd_input.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:11:59 GMT -->
</html>