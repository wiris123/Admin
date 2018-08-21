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
    
<script language="JavaScript" type="text/javascript">
<!--
var loding = false;
var prd_class = new Array();

	prd_class[0] = new Array();
	prd_class[0][0] = "100";
	prd_class[0][1] = "상품분류1";
	prd_class[0][2] = "0";
	prd_class[0][3] = "1";

	
	prd_class[1] = new Array();
	prd_class[1][0] = "100100";
	prd_class[1][1] = "2차분류1";
	prd_class[1][2] = "100";
	prd_class[1][3] = "2";

	
	prd_class[2] = new Array();
	prd_class[2][0] = "100100100";
	prd_class[2][1] = "3차분류1";
	prd_class[2][2] = "100100";
	prd_class[2][3] = "3";

	
	prd_class[3] = new Array();
	prd_class[3][0] = "100101";
	prd_class[3][1] = "2차분류2";
	prd_class[3][2] = "100";
	prd_class[3][3] = "2";

	
	prd_class[4] = new Array();
	prd_class[4][0] = "101";
	prd_class[4][1] = "상품분류2";
	prd_class[4][2] = "0";
	prd_class[4][3] = "1";

	
	prd_class[5] = new Array();
	prd_class[5][0] = "102";
	prd_class[5][1] = "상품분류3";
	prd_class[5][2] = "0";
	prd_class[5][3] = "1";

	var tno = 6;

function setClass01(){

	var arrayClass = eval("document.frm.class01");
	var arrayClass1 = eval("document.frm.class02");
	var arrayClass2 = eval("document.frm.class03");

	arrayClass.options[0] = new Option(":: 대분류 ::","");
	arrayClass1.options[0] = new Option(":: 중분류 ::","");
	arrayClass2.options[0] = new Option(":: 소분류 ::","");

	for(no=0,sno=1 ; no < tno ; no++){
		if(prd_class[no][3]=='1'){
			arrayClass.options[sno] = new Option(prd_class[no][1],prd_class[no][0]);
			sno++;
		}
	}
}

function changeClass01(){

	var arrayClass = eval("document.frm.class01");
	var arrayClass1 = eval("document.frm.class02");
	var arrayClass2 = eval("document.frm.class03");

	var selidx = arrayClass.selectedIndex;
	var selvalue = arrayClass.options[selidx].value;

	arrayClass1.options.length=0;
	arrayClass2.options.length=0;
	arrayClass1.options[0] = new Option(":: 중분류 ::","");
	arrayClass2.options[0] = new Option(":: 소분류 ::","");

	for(no=0,sno=1 ; no < tno ; no++){
		if(prd_class[no][3]=='2' && prd_class[no][2]==selvalue){
			arrayClass1.options[sno] = new Option(prd_class[no][1],prd_class[no][0]);
			sno++;
		}
	}

}

function changeClass02(){

	var arrayClass1 = eval("document.frm.class02");
	var arrayClass2 = eval("document.frm.class03");

	var selidx = arrayClass1.selectedIndex;
	var selvalue = arrayClass1.options[selidx].value;

	arrayClass2.options.length=0;
	arrayClass2.options[0] = new Option(":: 소분류 ::","");

	for(no=0,sno=1 ; no < tno ; no++){
		if(prd_class[no][3]=='3' && prd_class[no][2]==selvalue){
			arrayClass2.options[sno] = new Option(prd_class[no][1],prd_class[no][0]);
			sno++;
		}
	}

}

function changeClass03(){
}

// 상품카테고리 설정
function setCategory(){

	var arrayClass01 = eval("document.frm.class01");
	var arrayClass02 = eval("document.frm.class02");
	var arrayClass03 = eval("document.frm.class03");

	for(no=1; no < arrayClass01.length; no++){
		if(arrayClass01.options[no].value == ''){
			arrayClass01.options[no].selected = true;
			changeClass01();
		}
	}

	for(no=1; no < arrayClass02.length; no++){
		if(arrayClass02.options[no].value == ''){
			arrayClass02.options[no].selected = true;
			changeClass02();
		}
	}

	for(no=1; no < arrayClass03.length; no++){
		if(arrayClass03.options[no].value == '')
			arrayClass03.options[no].selected = true;
	}

}

function inputCheck(frm){

	if(loding == false){
		alert("상품정보를 가져오고 있습니다. 잠시후 재시도 하세요");
		return false;
	}
	if(frm.prdname.value == ""){
		alert("상품명을 입력하세요");
		frm.prdname.focus();
		return false;
	}
	content.outputBodyHTML();
}

//해당 이미지를 삭제한다.
function deleteImage(prdcode, prdimg, imgpath){
	if(imgpath == ""){
		alert("삭제할 이미지가 없습니다.");
		return;
	}
	else{
		if(confirm("이미지를 삭제하시겠습니까?"))
			document.location = "prd_savee9e3.html?mode=delete_image&amp;prdcode="+prdcode+"&prdimg="+prdimg+"&imgpath="+imgpath;
	}
	return;
}

function prdlayCheck(){
	}

function lodingComplete(){
	loding = true;
}

function prdCategory(){
	var url = "prd_catlist44fd.html?prdcode=";
	window.open(url, "prdCategory", "height=330, width=560, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=150, top=100");
}

function prdIcon(){
	var url = "prd_icon.html";
	window.open(url, "prdIcon", "height=250, width=450, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=150, top=100");
}

function setImgsize(){
	var url = "prd_imgsize.html";
	window.open(url, "setImgsize", "height=250, width=300, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=150, top=100");
}

//상품이동
function movePrd(){

	selvalue = "";

	if(selvalue == ""){
		alert("이동할 상품을 선택하세요.");
		return false;
	}
	else{
		var uri = "prd_move1b1b.html?selvalue=" + selvalue;
		window.open(uri,"movePrd","width=300,height=150");
	}
}

// 상품복사
function copyPrd(){
	selvalue = "";

	if(selvalue == ""){
		alert("복사할 상품을 선택하세요.");
		return false;
	}
	else{
		var uri = "prd_copy1b1b.html?selvalue=" + selvalue;
		window.open(uri,"copyPrd","width=300,height=150,resizable=yes");
	}
}

function prdFocus(){
	frm.prdname.focus();
}

//-->
</script>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="setClass01();setCategory();prdlayCheck();lodingComplete();prdFocus();">

<div id="location">HOME > 상품관리</div>
<div id="S_contents">
	
	<h3>상품관리<span> 연금보험 관리페이지입니다.</span></h3>

	<form name="frm" action="http://demohome.anywiz.co.kr/adm/manage/product/prd_save.php?page=&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey=" method="post" enctype="multipart/form-data" onSubmit="return inputCheck(this);">
	<input type="hidden" name="tmp">
	<input type="hidden" name="mode" value="insert">
	<input type="hidden" name="relidx" value="">
	<input type="hidden" name="prdcode" value="">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th>상품명</th>
		<td colspan="3">
			<input name="ann_name" type="text" value="" size="60" class="input">&nbsp;
		</td>
	</tr>
	<tr>
		<th>보험종류</th>
		<td colspan="3">
			<input name="instype" type="text" value="" size="30" class="input">
		</td>
	</tr>
	<tr>
		<th>연금게시일</th>
		<td colspan="3">
			<input name="instart" type="text" value="" size="50" class="input">
		</td>
	</tr>
	<tr>
		<th>연금납부연한</th>
		<td colspan="3">
			<input name="paytime" type="text" value="" size="50" class="input">
		</td>
	</tr>
	<tr>
		<th>월 납입액</th>
		<td colspan="3">
			<input type="text" name="monthpay" placeholder="계산식" />
	</td>
	</tr>
	<tr>
		<th>위험할증률</th>
		<td colspan="3">
			<input type="text" name="rprem" placeholder="1~10까지의 정수숫자" />
	</td>
	<tr>
		<th>보장수익률</th>
		<td colspan="3">
			<input type="text" name="interest" placeholder="1~10까지의 정수숫자" />
	</td>
	<tr>
		<th>매월 연금수령액</th>
		<td colspan="3">
			<input type="text" name="monthann" value="" />
	</td>
	<tr>
		<th>계약일자</th>
		<td colspan="3">
			<input type="text" name="regidate" value="" />
	</td>
	<tr>
		<th>계약상태</th>
		<td colspan="3">
			<select name="submit" id="">
				<option value="Y">Y</option>
				<option value="N">N</option>
				<option value="E">E</option>
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