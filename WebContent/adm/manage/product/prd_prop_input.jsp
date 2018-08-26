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
		if(f.monthpay.value==""){
			alert("월납입액을 입력하세요");
			f.monthpay.focus();
			return false;
		}
		if(f.hosp.value==""){
			alert("질병입원보장을 입력하세요");
			f.hosp.focus();
			return false;
		}
		if(f.gohosp.value==""){
			alert("질병통원보장을 입력하세요");
			f.gohosp.focus();
			return false;
		}
		
		if(f.sanghosp.value==""){
			alert("상해입원보장을 입력하세요");
			f.sanghosp.focus();
			return false;
		}
		if(f.sgohosp.value==""){
			alert("상해통원보장을 입력하세요");
			f.sgohosp.focus();
			return false;
		}
		if(f.chbedosu.value==""){
			alert("비급여도수를 입력하세요");
			f.chbedosu.focus();
			return false;
		}
		if(f.chbeinje.value==""){
			alert("체외충격파를 입력하세요");
			f.chbeinje.focus();
			return false;
		}
		if(f.chbemri.value==""){
			alert("자기공명진단을 입력하세요");
			f.chbemri.focus();
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
    
<script language="JavaScript" type="text/javascript">
</script>
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
			<input name="prop_name" type="text" value="" size="60" class="input">&nbsp;
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
			<input type="text" name="monthpay" />
	</td>
	</tr>
	<tr>
		<th>질병입원보장</th>
		<td colspan="3">
			<input type="text" name="hosp"  />
	</td>
	</tr>
	<tr>
		<th>질병통원보장</th>
		<td colspan="3">
			<input type="text" name="gohosp" />
	</td>
	</tr>
	<tr>
		<th>상해입원보장</th>
		<td colspan="3">
			<input type="text" name="sanghosp" />
	</td>
	</tr>
	<tr>
		<th>상해통원보장</th>
		<td colspan="3">
			<input type="text" name="sgohosp" />
	</td>
	</tr>
	<tr>
		<th>비급여도수</th>
		<td colspan="3">
			<input type="text" name="chbedosu"  />
	</td>
	</tr>
	<tr>
		<th>체외충격파</th>
		<td colspan="3">
			<input type="text" name="chbeinje" />
	</td>
	</tr>
	<tr>
		<th>자기공명진단</th>
		<td colspan="3">
			<input type="text" name="chbemri"/>
	</td>
	</tr>
	
			<tr>
		<th>첨부파일</th>
		<td colspan="3">
			<input type="file" name="attfile"/>
	</td>
	</tr>
			
			</table>
		</td>
	</tr>
	
	
</table>

<!-- <div id="prdlay2" style="display:none">
	<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="75%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inner_table left">
			<tr>
				<th width="150">원본 이미지</th>
				<td width="410"  colspan="3"><input type="file" name="realimg2" size="12" class="input"></td>
			</tr>
			<tr>
				<th>축소</th>
				<td  colspan="3">
					<input type="file" name="prdimg_S2" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>제품상세</th>
				<td  colspan="3">
					<input type="file" name="prdimg_M2" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>확대보기</th>
				<td  colspan="3">
					<input type="file" name="prdimg_L2" size="12" class="input">
									</td>
			</tr>
			</table>
		</td>
		<td width="25%" height="100%">
			<table width="100%" height="100%" cellspacing="1" cellpadding="2" class="inner_table">
			<tr>
				<td align="center" bgcolor="#ffffff">
				No Image				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</div>
<div id="prdlay3" style="display:none">
	<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="75%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inner_table left">
			<tr>
				<th width="150">원본 이미지</th>
				<td width="410"  colspan="3"><input type="file" name="realimg3" size="12" class="input"></td>
			</tr>
			<tr>
				<th>축소</th>
				<td  colspan="3">
					<input type="file" name="prdimg_S3" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>제품상세</th>
				<td  colspan="3">
					<input type="file" name="prdimg_M3" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>확대보기</th>
				<td  colspan="3">
					<input type="file" name="prdimg_L3" size="12" class="input">
									</td>
			</tr>
			</table>
		</td>
		<td width="25%" height="100%">
			<table width="100%" height="100%" cellspacing="1" cellpadding="2" class="inner_table">
			<tr>
				<td align="center" bgcolor="#ffffff">
				No Image				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</div>
<div id="prdlay4" style="display:none">
	<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="75%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inner_table left">
			<tr>
				<th width="150">원본 이미지</th>
				<td width="410"  colspan="3"><input type="file" name="realimg4" size="12" class="input"></td>
			</tr>
			<tr>
				<th>축소</th>
				<td  colspan="3">
					<input type="file" name="prdimg_S4" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>제품상세</th>
				<td  colspan="3">
					<input type="file" name="prdimg_M4" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>확대보기</th>
				<td  colspan="3">
					<input type="file" name="prdimg_L4" size="12" class="input">
									</td>
			</tr>
			</table>
		</td>
		<td width="25%" height="100%">
			<table width="100%" height="100%" cellspacing="1" cellpadding="2" class="inner_table">
			<tr>
				<td align="center" bgcolor="#ffffff">
				No Image				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</div>
<div id="prdlay5" style="display:none">
	<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td></td>
	</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="75%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inner_table left">
			<tr>
				<th width="150">원본 이미지</th>
				<td width="410"  colspan="3"><input type="file" name="realimg5" size="12" class="input"></td>
			</tr>
			<tr>
				<th>축소</th>
				<td  colspan="3">
					<input type="file" name="prdimg_S5" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>제품상세</th>
				<td  colspan="3">
					<input type="file" name="prdimg_M5" size="12" class="input">
									</td>
			</tr>
			<tr>
				<th>확대보기</th>
				<td  colspan="3">
					<input type="file" name="prdimg_L5" size="12" class="input">
									</td>
			</tr>
			</table>
		</td>
		<td width="25%" height="100%">
			<table width="100%" height="100%" cellspacing="1" cellpadding="2" class="inner_table">
			<tr>
				<td align="center" bgcolor="#ffffff">
				No Image				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</div> -->
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