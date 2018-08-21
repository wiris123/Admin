<%@page import="member1.OutMemDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");

MemberDAO dao = new MemberDAO();

Map<String,Object> param = new HashMap<String,Object>();

String queryStr = "";

String searchColumn = 
request.getParameter("searchColumn");
String searchWord = 
request.getParameter("searchWord");
if(searchWord!=null){
//입력한 검색어가 있다면 맵에 추가함
param.put("Column", searchColumn);
param.put("Word", searchWord);

//파라미터 추가
queryStr = String.format("searchColumn=%s"
	+"&searchWord=%s&", searchColumn,
		searchWord);
}

int totalRecordCount = dao.getTotalRecordCount2(param); 

//2.web.xml에 설정된 값 가져오기
int pageSize = Integer.parseInt(
	application.getInitParameter("PAGE_SIZE"));
int blockPage = Integer.parseInt(
	application.getInitParameter("BLOCK_PAGE"));

int totalPage = 
(int)Math.ceil((double)totalRecordCount/pageSize);

//4.페이지번호가 없는경우 무조건 1로 설정
int nowPage = 
  request.getParameter("nowPage")==null
  ? 1 : 
  Integer.parseInt(request.getParameter("nowPage"));

//5.가져올 레코드의 구간을 결정하기 위한 연산
int start = (nowPage-1)*pageSize + 1;
int end = nowPage * pageSize;

//6.파라미터 전달을 위해 map에 추가
param.put("start", start);
param.put("end", end);

List<OutMemDTO> bbs = dao.selectList2(param);

dao.close();
%>
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


</div><!-- //left_area// -->

<div id="Container">

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
    	
	 </table>
	  </form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
        <form>
        <thead> 
        <tr class="success">
          
          <td>번호</td>
          <td>회원명</td>
          <td>탈퇴사유</td>
          <td>탈퇴일</td>
          <!-- <td width="10%">탈퇴일</td> -->
          
        </tr>
        </thead> 
        </form>
		<tbody>       
		<%
if(bbs.isEmpty()){
	//컬렉션에 저장된 데이터가 없는경우
%>
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다^^*
			</td>
		</tr>
<%
}
else
{
	//컬렉션에 저장된 데이터가 있는경우 for-each문을통해
	//내용 출력
	int vNum = 0;
	int countNum = 0;
	for(OutMemDTO dto : bbs)
	{
		//게시물의 번호를 순서대로 출력하기위한
		//가상번호 생성(게시물의 갯수를 기준)
		vNum = totalRecordCount - 
			(((nowPage-1)*pageSize)+countNum++);
	
%>
	<!-- 리스트반복 -->
	<tr>
		<td class="text-center"><%=vNum %></td>
		<td class="text-center"><%=dto.getId() %></td>
		<td class="text-center"><%=dto.getReason() %></td>
		<td class="text-center"><%=dto.getRegidate() %></td>
	</tr>
	<!-- 리스트반복 -->
<%
	}//for-each문 끝
}//if문 끝
%>  
		       
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
