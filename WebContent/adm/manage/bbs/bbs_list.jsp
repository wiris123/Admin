<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script src="../js/sidemenu.js"></script>
</head>
<body class="home_body">
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
	
		<script Language="JavaScript" src="./select.js"></script>
		<%@include file="../include/bbs_left.jsp"%>
		<div id="Container">
	
			<div id="location">HOME > 게시판관리</div>
			<div id="S_contents">
				
				<jsp:include page="bbs_list_${param.b_id }.jsp" />
						
		</div>
		<!-- //Container// -->
	</div>
	<!-- //Container_wrap// -->
</div>
	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>