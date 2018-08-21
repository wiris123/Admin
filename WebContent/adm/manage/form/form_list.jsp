<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀</title>
<link rel="stylesheet" href="../css/jquery-ui.css">
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
</head>
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
	
</script>
<body>
	<%@include file="../include/head.jsp"%>
	
	

<div id="Container_wrap" class="right_close">
    <!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>

    <div id="left_area">
	<%@include file="../include/form_left.jsp"%>
	</div><!-- //left_area// -->

	<div id="Container">
   
<div id="location">HOME > 폼메일관리</div>
<div id="S_contents">
<h3>폼메일관리<span>작성된 폼메일을 관리 합니다.</span></h3>	

<form action="http://demohome.anywiz.co.kr/adm/manage/form/form_list.php">
<input type="hidden" name="code" value="">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
<tr>
  	<th width="15%">조건검색</th>
  	<td width="85%">
		<select name="searchstatus">
		<option value="">:: 처리상태 :: </option>
		<option value="대기중" >대기중</option>
		<option value="처리중" >처리중</option>
		<option value="처리완료" >처리완료</option>
		</select>
		<select name="searchopt">
		<option value="content">작성내용</option>
		</select>
		<input type="text" name="searchkey" value="" class="input">
		<button style="height:22px;vertical-align:bottom;" type="submit" class="b h28 t5 color blue_big">검색</button>
	</td>
</tr>
</table>
</form>


<table width="100%" border="0" cellpadding="0" cellspacing="2" class="top10">
  <tr>
    <td>총 등록수 : <b>2</b></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
	<form>
	<thead>
	<tr>
		<td width="5%">번호</td>
		<td>제목</td>
		<td width="10%">작성자</td>
		<td width="15%">작성일</td>
		<td width="10%">처리상태</td>
		<td width="10%">기능</td>
	</tr>
	</thead>
	</form>
	<tbody>
  <form>
  <input type="hidden" name="idx" value="167">
  <tr>
    <td>2</td>
    <td style="text-align:left;"><a href='form_input.jsp?code=&amp;searchopt=&amp;searchkey=&amp;searchstatus=&amp;idx=167&amp;page=1'>[상담예약메일] 이/가 들어왔습니다.</a> </td>
    <td style="padding:2px">테스트<br>vg2001@naver.com</td>
    <td>2016-05-27 14:49:38</td>
    <td>대기중</td>
    <td>
  		<button type="button" class="h18 t3 color small round red_s" onClick="document.location='form_input2f27.jsp?code=&amp;searchopt=&amp;searchkey=&amp;searchstatus=&amp;idx=167&amp;page=1';">보기</button>
  		<button type="button" class="h18 t3 color small round black_s" onClick="delConfirm('167')">삭제</button>
    </td>
  </tr>
  </form>
  <form>
  <input type="hidden" name="idx" value="166">
  <tr>
    <td>1</td>
    <td style="text-align:left;"><a href='form_input.jsp?code=&amp;searchopt=&amp;searchkey=&amp;searchstatus=&amp;idx=166&amp;page=1'>[이메일상담] 이/가 들어왔습니다.</a> </td>
    <td style="padding:2px">테스트<br>02-1111-1111<br>test@daum.net</td>
    <td>2016-05-09 15:20:58</td>
    <td>대기중</td>
    <td>
  		<button type="button" class="h18 t3 color small round red_s" onClick="document.location='form_input.jsp?code=&amp;searchopt=&amp;searchkey=&amp;searchstatus=&amp;idx=166&amp;page=1';">보기</button>
  		<button type="button" class="h18 t3 color small round black_s" onClick="delConfirm('166')">삭제</button>
    </td>
  </tr>
  </form>
</tbody>
</table>


<table width="100%"border="0" cellpadding="0" cellspacing="0" class="top5">
  <tr>
    <td width="33%"></td>
    <td width="33%">
    	<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>          <td width='22'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>          <td align='center'>&nbsp; <b>1</b> /           &nbsp; </td>          <td width='22' align='right'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>          <td width='22' align='right'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>        </tr>      </table>    </td></tr></table></td>
    <td width="33%"></td>
  </tr>
</table>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/form/form_list.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:10:48 GMT -->
</html>