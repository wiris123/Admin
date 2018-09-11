<%@page import="dto.MemberDTO"%>
<%@page import="controller.MemberDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	int[] list_count;
	BbsDAO listdao = new BbsDAO();
	MemberDAO memdao = new MemberDAO();
	//게시판 갯수관련
	list_count = listdao.listCount();
	//오늘 가입자수	, 전체 가입자수, 오늘 탈퇴수, 전체 탈퇴수
	int todayregi = memdao.regiToday();
	int totalregi = memdao.regiTotal(); 
	int todayout = memdao.outToday();
	int totalout = memdao.outTotal(); 
	
	//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
	Map<String, Object> param = new HashMap<String, Object>();
	//최신의 5개만 가져오면 된다
	param.put("start", 1);
	param.put("end", 5);
	//리스트 가져오기
	List<BoardDTO> bbs = listdao.selectTotalList(param);
	int todayPost = listdao.todayPost();
	//멤버 가져오기
	List<MemberDTO> membbs = memdao.selectList(param);
	listdao.close();
	memdao.close();
%>
<!DOCTYPE html>
<html>
<head>
<title>홈페이지 관리자</title>
<link rel="stylesheet" href="../css/jquery-ui.css">
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
<script>	
	window.onload = function() {

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			title : {
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
	<!-- 헤드부분 -->
	<%@include file="../include/head.jsp"%>
	<div id="Container_wrap" class="left_close right_close">
		<div id="Container">
			<div class="main_cont">
				<!-- 메인 컨텐츠 여백 -->
				<div class="leftcont M_latest">
					<p class="tit type1">최근게시물</p>
					<div class="bbs">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<!-- 최근 게시물 반복 시작 -->
<%
//없을경우 추가해라 : 네..
	for (BoardDTO dto : bbs) {
%>
							<tr>
								<td><a href="../bbs/bbs_contents.jsp?b_id=<%=dto.getB_id() %>&num=<%=dto.getNum() %>&nowPage=">[<%=dto.getB_name() %>]
										<%=dto.getTitle() %></a></td>
								<td align="right" class="date"><%=dto.getRegidate() %></td>
							</tr>
<%} %>
						</table>
					</div>
					<div class="bbs_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td class="first"><p>총 게시판수</p> <b>3</b> 개</td>
								<td><p>총 게시물</p> <b><%=list_count[0]+list_count[1]+list_count[2] %></b> 개</td>
								<td><p>오늘 게시물</p> <b><%=todayPost %></b> 개</td>
								<td><p>오늘 댓글</p> <b>0</b> 개</td>
							</tr>
						</table>
					</div>
					<a href="../bbs/bbs_manage_list.html" onFocus="this.blur();"
						class="more"><img src="../image/main/more.gif" /></a>
				</div>
				<!-- //M_latest// -->

				<!-- //M_visitor// -->


				<div class="rightcont M_visitor">
					<p class="tit type1">
						회원현황<a href="../member/member_list.html"
							style="float: right; padding-right: 10px; padding-top: 3px"><img
							src="../image/main/more.gif" /></a>
					</p>

					<div class="visitor_latest">		
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<!-- 회원 현황 뿌려주기 -->
<% 
//없을경우 추가해라 : 네..
for(MemberDTO dto : membbs){ %>
							<tr>
								<td class="lt"><%=dto.getId() %></td>
								<td><%=dto.getName() %></td>
								<td><%=dto.getEmail() %></td>
								<td><%=dto.getRegidate() %></td>
							</tr>
<%} %>
						</table>
					</div>

					<div class="visitor_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0" >
							<tr>
								<td style="text-align:center;">
									<p style="font-weight:bold;">오늘 가입회원</p><b style="font-size:14px;color:#0066FF"><%=todayregi %></b>&nbsp;명
								</td>
								<td style="text-align:center;">
									<p style="font-weight:bold;">전체 회원수</p><b style="font-size:14px;color:#0066FF"><%=totalregi %></b>&nbsp;명
								</td>
								<td style="text-align:center;">
									<p style="font-weight:bold;">오늘 탈퇴회원</p> <b style="font-size:14px;color:#CC0033"><%=todayout %></b>&nbsp;명
								</td>
								<td style="text-align:center;">
									<p style="font-weight:bold;">총 탈퇴회원</p><b style="font-size:14px;color:#CC0033" ><%=totalout %></b>&nbsp;명
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- //M_member// -->

				<div class="leftcont graph1 top20">
					<div class="cont">
						<p class="tit type2">
							<span>게시판</span>통계<a href="../bbs/bbs_connect.html"
								style="float: right; padding-right: 10px; padding-top: 3px"><img
								src="../image/main/more.gif" /></a>
						</p>
						<br />
						<script type="text/javascript" src="../../js/json2.js"></script>
						<script type="text/javascript" src="../../js/swfobject.js"></script>
						<script type="text/javascript">
							swfobject
									.embedSWF(
											"../../flashChart/open-flash-chart.swf",
											"my_chart1",
											"100%",
											"250",
											"9.0.0",
											"../../flashChart/expressInstall.html",
											{
												"data-file" : "/adm/flashChart/chartData.php?chart_param=board",
												"loading" : "로딩중..."
											}, {
												"wmode" : "transparent"
											});
						</script>
						<div id="chartContainer" style="height: 200px; width: 100%;"></div>
						<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
						<div style="padding-top: 5px">
							<font style='padding-left: 15px' color='#01a595'>■</font><font
								style='color: #797979; font-size: 11px;'>게시글수 : <%=list_count[0]+list_count[1]+list_count[2] %></font>
						</div>
						
					</div>
					
				</div>
				<!-- //graph1// -->
				<div class="rightcont graph2 top20">
					<div class="cont">
						<p class="tit type2">
							<span>접속</span>통계<a href="../connect/connect_list.html"
								style="float: right; padding-right: 10px; padding-top: 3px"><img
								src="../image/main/more.gif" /></a>
						</p>
						<br />
						<script type="text/javascript" src="../../js/json2.js"></script>
						<script type="text/javascript" src="../../js/swfobject.js"></script>
						<script type="text/javascript">
							swfobject
									.embedSWF(
											"../../flashChart/open-flash-chart.swf",
											"my_chart2",
											"100%",
											"250",
											"9.0.0",
											"../../flashChart/expressInstall.html",
											{
												"data-file" : "/adm/flashChart/chartData.php?chart_param=common|OD|2018-08-01|2018-08-31",
												"loading" : "로딩중..."
											}, {
												"wmode" : "transparent"
											});
						</script>
						<div id="my_chart2"></div>
						<div style="padding-top: 5px">
							<font style='padding-left: 15px' color='#01a595'>■</font><font
								style='color: #797979; font-size: 11px;'>방문자수</font>
						</div>
					</div>
					<!-- //graph2// -->

				</div>
				<!-- //main_cont// -->
			</div>
			<!-- //Container// -->
		</div>
		<!-- //Container_wrap// -->
	</div>
</body>
</html>