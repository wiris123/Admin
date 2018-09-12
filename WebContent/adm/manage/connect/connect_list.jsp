<%@page import="dto.VisitorValDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.VisitorDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="controller.ConnectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ConnectDAO dao = new ConnectDAO(); 

//오늘 날짜를 가져오기
Date date = new Date();
SimpleDateFormat dt1 = new SimpleDateFormat("YYYY-MM-dd");
String today = dt1.format(date);
String end = (request.getParameter("todate")=="")?today:request.getParameter("todate");

//칼렌더를 이용하여서 다양한 날짜 가져오기
Calendar calw = Calendar.getInstance();
Calendar calm = Calendar.getInstance();
Calendar caly =  Calendar.getInstance();
java.text.DateFormat format = new java.text.SimpleDateFormat("YYYY-MM-dd");

//7일, 한달, 세달, 6개월, 1년 단위를 구한다
calw.add(calw.DATE, -7); // 7일(일주일)을 뺀다
String aweak = format.format(calw.getTime());//디비타입에 맞게 형변환후 저장
calm.add(calm.MONTH, -1); // 한달을 뺀다
String oneMonth = format.format(calm.getTime()); //한달전 저장
calm.add(calm.MONTH, -2); // 두달을 더뺀다(총 3달)
String threeMonth = format.format(calm.getTime());
calm.add(calm.MONTH, -3); // 세달을 더뺀다(총 6달)
String sixMonth = format.format(calm.getTime());
caly.add(caly.YEAR, -1);//1년을 뺸다
String year = format.format(caly.getTime());
VisitorValDTO avdto = dao.getTotVisitor();

System.out.println("한달:"+oneMonth+"\n세달:"+threeMonth+"\n여섯달:"+sixMonth);

String start = (request.getParameter("fromdate")=="")?aweak:request.getParameter("fromdate");

List<VisitorDTO> bbs = dao.selectList(start, end);
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
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<script src="../js/canvasjs.min.js"></script>
<script type="text/javascript" src="../../js/json2.js"></script>
<script type="text/javascript" src="../../js/swfobject.js"></script>
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
			$.cookie('left_quick', 'close', { expires: 1, path: '/', domain: 'localhost:8080', secure: false });
		}
		else {
			$.cookie('left_quick', 'open', { expires: 1, path: '/', domain: 'localhost:8080', secure: false });			
		}
	}
	function chgTerm(term){
		
		var f	 =  document.getElementById('frm');
		f.fromdate.value	= term;
		f.submit();
	}
</script>
</head>
<body>
<!-- 헤드 -->
<%@include file="../include/head.jsp"%>

<%@include file="../include/connect_left.jsp"%>

	</div><!-- //left_area// -->

	<div id="Container">

 <div id="location">HOME > 접속자분석</div>
<div id="S_contents">
<h3>접속자분석<span>접속자를 오늘/시간/일별/월별/년별 로 분석합니다.</span></h3>	

<form name="frm" id="frm" action="./connect_list.jsp" method="get">
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="table_basic">
	<tr>
		<th width="15%">분석방법</th>
		<td width="85%">
			<button type="button" class="h22 small t3 gray_s" value="<%=aweak %>" onclick="chgTerm(this.value);">1주일</button>
			<button type="button" class="h22 small t3 gray_s" value="<%=oneMonth %>" onclick="chgTerm(this.value);">1개월</button>
			<button type="button" class="h22 small t3 gray_s" value="<%=threeMonth %>" onclick="chgTerm(this.value);">3개월</button>
			<button type="button" class="h22 small t3 gray_s" value="<%=sixMonth %>" onclick="chgTerm(this.value);">6개월</button>
			<button type="button" class="h22 small t3 gray_s" value="<%=year %>" onclick="chgTerm(this.value);">1년</button>
		</td>	
	</tr>
	<tr>
		<th>기간</th>
		<td>	
			<input class="input w100" type="text" id="datepicker1" name="fromdate" value="<%=aweak %>" readonly>
			<input type="button" class="btn_calendar" id="" disabled/> ~
			<input class="input w100" type="text" id="datepicker2" name="todate" value="<%=today %>" readonly>
			<input type="button" class="btn_calendar" id="" disabled/>				
			<button style="height:22px;vertical-align:bottom;" type="submit" class="b h28 t5 color blue_big">검색</button>
		</td>
	</tr>	
</table>
</form>
<br />
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
<%for(VisitorDTO dto : bbs){%>
			{ x: new Date(<%=dto.getVisit_date()%>), y: <%=dto.getVal()%> },
<%}%>
		]
		
	}]
});


	chart.render(); 
}
</script>

<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>


<div id="my_chart11"></div><table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic top10">
	<tr>
		<th width="25%" height="30">총 접속자 수</th>
		<td width="25%"><font color=064F92><B><%=avdto.getTot() %></b></font>명</td>
		<th width="25%">평균 접속자 수</th>
		<td width="25%"><font color=064F92><B><%=avdto.getAvg()%></b></font>명</td>
	</tr>
	<tr>
		<th height="30">오늘 접속자 수</th>
		<td><font color=064F92><B>56</b></font>명</td>
		<th>어제 접속자 수</th>
		<td><font color=064F92><B>1</b></font>명</td>
	</tr>
	<tr>
		<th height="30">이번달 접속자 수</th>
		<td><font color=064F92><B>56</b></font>명</td>
		<th>이번달 평균 접속자 수</th>
		<td><font color=064F92><B>7</b></font>명</td>
	</tr>
</table>

</div>
</div><!-- //Container// -->


<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>


</body>

</html>