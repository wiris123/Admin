<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	int[] list_count;
	BbsDAO dao = new BbsDAO();
	list_count = dao.listCount();
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 관리</title>
<script src="../js/sidemenu.js"></script>
<script>
	window.onload = function() {

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			title : {
				text : "Email Categories",
				horizontalAlign : "left"
			},
			data : [ {
				type : "doughnut",
				startAngle : 60,
				//innerRadius: 60,
				indexLabelFontSize : 17,
				indexLabel : "{label} - #percent%",
				toolTipContent : "<b>{label}:</b> {y} (#percent%)",
				dataPoints : [ {
					y :<%=list_count[0]%>, label : "공지사항"
				}, {
					y :<%=list_count[1]%>
	,
					label : "이벤트"
				}, {
					y :<%=list_count[2]%>
	,
					label : "질의응답"
				}, ]
			} ]
		});
		chart.render();

	}
</script>
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
	
		<script Language="JavaScript" src="./select.js">	</script>
		<%@include file="../include/bbs_left.jsp"%>
		<div id="Container">
	
			<div id="location">HOME > 게시판관리</div>
			<div id="S_contents">
				
					<div id="chartContainer" style="height: 370px; width: 100%;"></div>
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
						
		</div>
		<!-- //Container// -->
	</div>
	<!-- //Container_wrap// -->
</div>

</body>
</html>