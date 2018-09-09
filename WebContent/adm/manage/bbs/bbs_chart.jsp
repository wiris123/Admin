<%@page import="dto.BoardDTO"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
System.out.println(application.getRealPath("/Upload"));
%>
<!DOCTYPE html>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	int[] list_count;
	BbsDAO dao = new BbsDAO();
	list_count = dao.listCount();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀</title>
</head>

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
					y :<%=list_count[0]%>, label : "free"
				}, {
					y :<%=list_count[1]%>
	,
					label : "photo"
				}, {
					y :<%=list_count[2]%>
	,
					label : "response"
				}, ]
			} ]
		});
		chart.render();

	}
</script>
</head>
<body>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>