<%@page import="dto.MemberDTO"%>
<%@page import="util.PagingUtil"%>
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

int totalRecordCount = dao.getTotalRecordCount(param); 

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

List<MemberDTO> bbs = dao.selectList(param);

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

</div>

<div id="Container">

<div id="location">HOME > 회원관리</div>
<div id="S_contents">
<h3>회원관리<span>회원을  관리합니다.</span></h3>	 

	<div class="row text-right" style="margin-bottom:20px;
		padding-right:50px;">
<!-- 검색부분 -->
<form class="form-inline">	
	
	<input type="hid den" name="nowPage" value="1" />
	<div class="form-group">
		<select name="searchColumn" class="form-control">
			<option value="name">고객명</option>
	         <option value="id">아이디</option>
	        
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="searchWord"  class="form-control"/>
		<div class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</div>
	</div>
</form>	
</div>
    <!--  <form name="searchForm" action="http://demohome.anywiz.co.kr/adm/manage/member/member_list.php" method="get" onSubmit="return delUser(this);">
	  <input type="hidden" name="page" value="">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
      <tr>
      <th width="15%">조건검색</th>
      <td align="left" width="85%">
         <select name="searchopt" class="select">
	         <option value="name">고객명</option>
	         <option value="id">아이디</option>
	         <option value="email">이메일</option>
	         <option value="mobile">전화번호</option>
	     </select>
			<input type="text" name="searchkey" value="" class="input">
			<button type="submit" style="height:22px" class="b h28 t5 color blue_big">검색</button>
		</td>
       </tr>
       
       </table>

       
     </td>
     </tr>
     </table>
	 </form>
 -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="top15">
        <tr>
          
          <td align="right">
			  
			  <button type="button" class="h22 t4 small icon gray" onClick="document.location='member_write.jsp';"><span class="icon_plus"></span>회원등록</button>
          </td>
        </tr>
      </table>
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
        <form>
        <thead> 
        <tr class="success">
          
          <td width="5%">번호</td>
          <td>아이디</td>
          <td width="15%">패스워드</td>
          <td width="15%">이름</td>
          <td width="15%">이메일</td>
          <td width="5%">전화번호</td>
          <td width="10%">생일</td>
          <td width="10%">가입일</td>
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
	for(MemberDTO dto : bbs)
	{
		//게시물의 번호를 순서대로 출력하기위한
		//가상번호 생성(게시물의 갯수를 기준)
		vNum = totalRecordCount - 
			(((nowPage-1)*pageSize)+countNum++);
	
%>
	<!-- 리스트반복 -->
	<tr>
		<td class="text-center"><%=vNum %></td>
		<td class="text-left">
			<a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>">
				<%=dto.getId() %>
			</a></td>
		<td class="text-center"><%=dto.getPass() %></td>
		<td class="text-center"><%=dto.getName() %></td>
		<td class="text-center"><%=dto.getEmail() %></td>
		<td class="text-center"><%=dto.getMobile() %></td>
		<td class="text-center"><%=dto.getBirth() %></td>
		<td class="text-center"><%=dto.getRegidate() %></td>
	</tr>
	<!-- 리스트반복 -->
<%
	}//for-each문 끝
}//if문 끝
%>  
      	      
      	
           
        
      	</tbody> 
      </table>
   

      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
      	<tr><td height="5"></td></tr>
        
      </table>

<div class="row text-center">
	<!-- 페이지번호 부분 -->
	<ul class="pagination">
		<%=PagingUtil.pagingHomepy(totalRecordCount,
			pageSize, 
			blockPage,
			nowPage,
			"member_list.jsp?"+queryStr) %>
	</ul>	
</div>
</div>
</div><!-- //Container// -->


<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

</html>
