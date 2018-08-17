<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

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
<body class="home_body">
<%@include file="../include/head.jsp"%>




<%@include file="../include/member_left.jsp"%>
<!-- <div id="Container_wrap" class="right_close">
    
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
   
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>

    <div id="left_area">
		



<h2><img src="../image/header/icon3.png" alt=""> 회원관리</h2>
<ul id="Lnb">
	<li class="on"><a href="member_list.jsp" onFocus="this.blur();">회원관리</a>
		<ul>
			<li class="">
				<a href="member_list.jsp">회원목록</a>
			</li>
			<li>
				<a href="level_list.html">회원등급</a>
			</li>
			<li>
				<a href="out_list.jsp">탈퇴회원</a>
			</li>
			<li>
				<a href="mail_list.html">이메일,SMS설정</a>
			</li>
			<li>
				<a href="mail_test.html">메일발송테스트</a>
			</li>
			<li>
				<a href="mail_send.html">단체메일발송</a>
			</li>
						<li>
				<a href="sms_send.html">단체SMS발송</a>
			</li>
						<li>
				<a href="member_analy.html">회원통계</a>
			</li>
			<li>
				<a href="member_config.html">가입약관 및 개인정보 보호정책</a>
			</li>
		</ul>
	</li>
		</ul>







 -->

	</div><!-- //left_area// -->

	<div id="Container">
    





















<script language="JavaScript" type="text/javascript">
<!--
// 탈퇴회원 삭제
function delMemout(idx){
	if(confirm('삭제하시겠습니까?')){
		document.location = 'member_save6e40.html?mode=memoutdel&amp;idx=' + idx;
	}
}
//-->
</script>
</head>

<div id="location">HOME > 회원관리</div>
<div id="S_contents">
<h3>탈퇴회원<span>탈퇴회원을 조회 관리합니다.</span></h3>	 

      <form name="searchForm" action="http://demohome.anywiz.co.kr/adm/manage/member/out_list.php" method="get">
      <input type="hidden" name="page" value="">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
      <tr>
      <th width="15%">조건검색</th>
      <td width="85%">

        <select name="searchopt" class="select">
        <option value="name" >고객명</option>
        <option value="memid" >아이디</option>
        </select>
        <input type="text" name="searchkey" value="" class="input">
        <button type="submit" style="height:22px" class="b h28 t5 color blue_big">검색</button>
        
        <script language="javascript">
        searchopt = document.searchForm.searchopt;
        for(ii=0; ii<searchopt.length; ii++){
          if(searchopt.options[ii].value == "")
            searchopt.options[ii].selected = true;
        }
        </script>
      </td>
    	</tr>
    	<tr>
    <th>탈퇴일</th>
    <td>
		<input class="input w100" type="text" id="datepicker1" name="sdate" value="" >
		<input type="button" class="btn_calendar" id=""/> ~
		<input class="input w100" type="text" id="datepicker2" name="edate" value="" >
		<input type="button" class="btn_calendar" id=""/>
    </td>
    </tr>
	 </table>
	  </form>
		      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top15">
      	<thead>
        <tr>
          <td width="8%">번호</td>
          <td>회원명</td>
          <td>탈퇴사유</td>
          <td>충고내용</td>
          <td width="10%">탈퇴일</td>
          <td width="10%">기능</td>
        </tr>
        </thead>
		<tbody>
		        <tr>
          <td>3</td>
          <td>테스트2 (test2)</td>
          <td>test2</td>
          <td>ttest2</td>
          <td>2016-05-24</td>
          <td><button type="button" class="h18 t3 color small round red_s" onclick="delMemout('5352');">삭제</button></td>
        </tr>
     	        <tr>
          <td>2</td>
          <td>테스트 (test)</td>
          <td>asdf</td>
          <td>test</td>
          <td>2016-05-24</td>
          <td><button type="button" class="h18 t3 color small round red_s" onclick="delMemout('5351');">삭제</button></td>
        </tr> 
        <tr>
          <td>224</td>
          <td>테스트 (test)</td>
          <td>asdf</td>
          <td>test</td>
          <td>2016-05-24</td>
          <td><button type="button" class="h18 t3 color small round red_s" onclick="delMemout('5351');">삭제</button></td>
        </tr>
     	        <tr>
          <td>1</td>
          <td>테스트 (test)</td>
          <td>탈퇴</td>
          <td>탈퇴</td>
          <td>2016-04-18</td>
          <td><button type="button" class="h18 t3 color small round red_s" onclick="delMemout('5308');">삭제</button></td>
        </tr>
     		  </tbody>
      </table>

      <div class="center">
      		    <table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='out_list5fa6.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>          <td width='22'><a href='out_list5fa6.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>          <td align='center'>&nbsp; <b>1</b> /           &nbsp; </td>          <td width='22' align='right'><a href='out_list5fa6.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>          <td width='22' align='right'><a href='out_list5fa6.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>        </tr>      </table>    </td></tr></table>      </div>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>


</html>
