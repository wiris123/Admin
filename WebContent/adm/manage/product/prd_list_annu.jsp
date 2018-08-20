<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="../../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<!-- <script src="../../js/jquery.highchartTable.js"></script> -->
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
<h3>상품관리<span>상품 검색/추가/수정/삭제 관리합니다.</span></h3>	

	   <form name="searchForm" action="http://demohome.anywiz.co.kr/adm/manage/product/prd_list.php" method="get">
      <input type="hidden" name="page" value="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
		<tr>
		<th width="15%">상품분류</th>
		<td width="85%">
			<select name="dep_code" onChange="catChange(this.form,'1');">
			<option value=''>:: 대분류 ::
			<option value='100'>상품분류1<option value='101'>상품분류2<option value='102'>상품분류3			</select>
			<select name="dep2_code" onChange="catChange(this.form,'2');" class="select">
			<option value=''> :: 중분류 ::
						</select>
			<select name="dep3_code" onChange="catChange(this.form,'3');" class="select">
			<option value=''> :: 소분류 ::
						</select>
			<input type="checkbox" name="recom" value="Y" >추천상품
		</td>
		</tr>
		<tr>
		<th>조건검색</th>
		<td>
			<select name="searchopt" class="select">
			<option value="prdnum" >상품코드
			<option value="prdname" >상품명
			</select>
			<input type="text" name="searchkey" value="" class="input"> <button style="height:22px;vertical-align:bottom;" type="submit" class="b h28 t5 color blue_big">검색</button>
			<script language="javascript">
			searchopt = document.searchForm.searchopt;
			for(ii=0; ii<searchopt.length; ii++){
			  if(searchopt.options[ii].value == "")
			    searchopt.options[ii].selected = true;
			}
			</script>
		</td>
		</tr>
		</table>
		</form>
		      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="top10">
        <tr>
          <td>총 상품수 : <b>1</b> , 검색 상품수 : <b>1</b></td>
          <td align="right">
				<button type="button" class="h22 t4 small icon gray" onClick="document.location='prd_input2e57.jsp?mode=insert';"><span class="icon_plus"></span>상품등록</button>
          </td>
        </tr>
      </table>
		      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
      	<form>
      	<thead>
        <tr>
        	<td width="5%"><input type="checkbox" name="select_tmp" onClick="selectReverse(this.form)"></td>
          <td width="5%">번호</td>
          <td>상품명</td>
          <td width="10%">상품코드</td>
          <!-- <td width="10%">진열순서</td> -->
          <td width="15%">기능</td>
        </tr>
		</thead>
      </form>
		<tbody>
				<form name="frm6">
		<input type="hidden" name="prdcode" value="1605270003">
			
     			<form name="frm1">
		<input type="hidden" name="prdcode" value="1606030001">
			<tr>
			<td><input type="checkbox" name="select_checkbox"></td>
			<td>1</td>
			<td style="padding-left:20px; text-align:left">
				<img src="../../data/product/1606030001_R.jpg" align="absmiddle" width="50" height="50">
				<a href="prd_input4054.html?mode=update&amp;prdcode=1606030001&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey=">상품명</a>
			</td>
			<td>0006</td>
			<!-- <td>
				<table border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
				<td><a href="prd_save64a4.html?mode=prior&amp;posi=upup&amp;prdcode=1606030001&amp;prior=160527190456&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey="><img src="../image/upup_icon.gif" border="0" alt="10단계 위로"></a></td>
				<td width="4"></td>
				<td></td>
				</tr>
				<tr>
				<td><a href="prd_savef9d2.html?mode=prior&amp;posi=up&amp;prdcode=1606030001&amp;prior=160527190456&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey="><img src="../image/up_icon.gif" border="0" alt="1단계 위로"></a></td>
				<td width="4"></td>
				<td><a href="prd_savec492.html?mode=prior&amp;posi=down&amp;prdcode=1606030001&amp;prior=160527190456&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey="><img src="../image/down_icon.gif" border="0" alt="1단계 아래로"></a></td>
				</tr>
				<tr>
				<td></td>
				<td width="4"></td>
				<td><a href="prd_save47f7.html?mode=prior&amp;posi=downdown&amp;prdcode=1606030001&amp;prior=160527190456&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey="><img src="../image/downdown_icon.gif" border="0" alt="10단계 아래로"></a> </td>
				</tr>
				</table>
			</td> -->
			<td>
				<button type="button" class="h18 t3 color small round red_s" onclick="document.location='prd_input4054.html?mode=update&amp;prdcode=1606030001&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='">수정</button>
				<button type="button" class="h18 t3 color small round black_s" onclick="delConfirm('1606030001');">삭제</button>
			</td>
			</tr>
		</form>
     		  </tbody>
      </table>

		<table width="100%"  border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td width="33%">
			<button type="button" class="h22 t4 small icon gray" onClick="prdDelete();"><span class="icon_plus"></span>선택삭제</button>
			<button type="button" class="h22 t4 small icon gray" onClick="movePrd();"><span class="icon_plus"></span>상품이동</button>
			<button type="button" class="h22 t4 small icon gray" onClick="copyPrd();"><span class="icon_plus"></span>상품복사</button>
			</td>
			<td width="33%">    <table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>          <td width='22'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>          <td align='center'>&nbsp; <b>1</b> /           &nbsp; </td>          <td width='22' align='right'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>          <td width='22' align='right'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>        </tr>      </table>    </td></tr></table></td>
			<td width="33%" align="right"></td>
			</tr>
		</table>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/product/prd_list.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:11:57 GMT -->
</html>
	
	
</body>
</html>