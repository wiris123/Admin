<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>홈페이지 관리자</title>
<link rel="stylesheet" href="../css/jquery-ui.css">
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
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
							<tr>
								<td><a href="../bbs/list8073.html?code=movieBasic">[동영상]
										동영상 게시판 입니다.</a></td>
								<td align="right" class="date">2016-06-14</td>
							</tr>

							<tr>
								<td><a href="../bbs/list8073.html?code=movieBasic">[동영상]
										동영상 게시판 입니다.</a></td>
								<td align="right" class="date">2016-06-14</td>
							</tr>

							<tr>
								<td><a href="../bbs/list8073.html?code=movieBasic">[동영상]
										동영상 게시판 입니다.</a></td>
								<td align="right" class="date">2016-06-14</td>
							</tr>

							<tr>
								<td><a href="../bbs/list8073.html?code=movieBasic">[동영상]
										동영상 게시판 입니다.</a></td>
								<td align="right" class="date">2016-06-14</td>
							</tr>

							<tr>
								<td><a href="../bbs/list8073.html?code=movieBasic">[동영상]
										동영상 게시판 입니다.</a></td>
								<td align="right" class="date">2016-06-14</td>
							</tr>

							<tr>
								<td><a href="../bbs/lista09c.html?code=bbsAgree">[약관동의]
										약관동의 게시판 입니다.</a></td>
								<td align="right" class="date">2016-06-14</td>
							</tr>

						</table>
					</div>
					<div class="bbs_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td class="first"><p>총 게시판수</p> <b>24</b> 개</td>
								<td><p>총 게시물</p> <b>112</b> 개</td>
								<td><p>오늘 게시물</p> <b>0</b> 개</td>
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
							<tr>
								<td class="lt">test5</td>
								<td>김민수</td>
								<td>일반회원</td>
								<td>2016-07-27</td>
							</tr>
							<tr>
								<td class="lt">test2</td>
								<td>테스트2</td>
								<td>일반회원</td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<td class="lt">test</td>
								<td>테스트</td>
								<td>일반회원</td>
								<td>2016-05-25</td>
							</tr>
							<tr>
								<td class="lt">test3</td>
								<td>테스트3</td>
								<td>일반회원</td>
								<td>2016-04-12</td>
							</tr>



						</table>
					</div>

					<div class="visitor_stats">
						<table width="100%" height="100%" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td class="lt">
									<p>오늘 가입회원</p> <img src="../image/main/blue0.gif"
									align="absbottom" /> <b>명</b>
								</td>
								<td>
									<p>전체 회원수</p> <img src="../image/main/red4.gif"
									align="absbottom" /> <b>명</b>
								</td>
								<td>
									<p>오늘 탈퇴회원</p> <img src="../image/main/black0.gif"
									align="absbottom" /> <b>명</b>
								</td>
								<td>
									<p>총 탈퇴회원</p> <img src="../image/main/black3.gif"
									align="absbottom" /> <b>명</b>
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
						<div id="my_chart1"></div>
						<div style="padding-top: 5px">
							<font style='padding-left: 15px' color='#01a595'>■</font><font
								style='color: #797979; font-size: 11px;'>게시글수</font> <font
								style='padding-left: 15px' color='#FD6E06'>■</font><font
								style='color: #797979; font-size: 11px;'>코멘트수</font>
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