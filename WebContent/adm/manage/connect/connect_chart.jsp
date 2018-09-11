<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%

%>

<script>
var chart = null;
var dataPoints = [];
window.onload = function() {

chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "접속 통계 차트"
	},
	axisY: {
		title: "",
		titleFontSize: 24
	},
	data: [{
		type: "column",
		yValueFormatString: "#,### Units",
		dataPoints: [
			{ x: new Date(2017, 8, 2), y: 5 },
			{ x: new Date(2017, 8, 2), y: 8 },
			{ x: new Date(2017, 8, 3), y: 3 },
			{ x: new Date(2017, 8, 4), y: 1 },
			{ x: new Date(2017, 8, 5), y: 5 },
			{ x: new Date(2017, 8, 6), y: 2 },
			{ x: new Date(2017, 8, 7), y: 6 },
			{ x: new Date(2017, 8, 8), y: 3 },
			{ x: new Date(2017, 8, 9), y: 3 },
			{ x: new Date(2017, 8, 10), y: 1 },
			{ x: new Date(2017, 8, 11), y: 2 }
		]
		
	}]
});


	chart.render(); 
}
</script>

<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="../js/canvasjs.min.js"></script>
