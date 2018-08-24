<%@page import="dto.CounselDTO"%>
<%@page import="controller.CounselDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<%
//한글처리
request.setCharacterEncoding("UTF-8");

String idx = request.getParameter("idx");
String flag =  request.getParameter("flag")==null ? "f" : request.getParameter("flag");
//커넥션풀로 변경
CounselDAO dao = new CounselDAO();

//게시물 가져오기
CounselDTO dto = dao.selectView(idx,flag);

//EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);

dao.close();//DB자원반납
%>    
<body>
<!-- 헤드 -->
<%@include file="../include/head.jsp"%>
<!-- 레프트 -->
<div id="Container_wrap" class="right_close">
    <!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>
	
	<%@include file="../include/common_form.jsp" %>
	
    <div id="left_area">
		<%@include file="../include/form_left.jsp"%>
	</div><!-- //left_area// -->

	<div id="Container">
   
<div id="location">HOME > <%= path_str %></div>
<div id="S_contents">
<h3><%= path_str %><span>작성된 <%= path_str %>를 합니다.</span></h3>	
<!-- 검색폼 -->
<form action="http://demohome.anywiz.co.kr/adm/manage/form/form_list.php">
<input type="hidden" name="flag" value="<%=flag %>" />
<input type="hidden" name="nowPage" value="1" />

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
	<thead>
	<tr>
		<td width="5%">번호</td>
		<td width="10%">이름</td>
		<td width="10%">모바일</td>
		<td width="15%">등록일</td>
		<td width="10%">상담내용</td>
		<td width="10%">분류</td>
	</tr>
	</thead>
	<tbody>
	
	<tr>
   		<td width="5%"><%=dto.getIdx() %></td>
		<td width="10%"><%=dto.getName() %></td>
		<td width="10%"><%= dto.getMobile() %></td>
		<td width="10%"><%= dto.getRegidate() %></td>
		<td width="30%"><%= dto.getContents() %></td>
		<td width="5%"><%= dto.getFlag() %></td>
  </tr>
  </table>
  </form>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/form/form_list.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:10:48 GMT -->
</html>