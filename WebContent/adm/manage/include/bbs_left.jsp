<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
</head>
<body class="home_left">
	<div id="left_area">
		<h2>
			<img src="../image/header/icon3.png" alt=""> 게시판 관리
		</h2>
		<ul id="Lnb">
			<li class="on"><a href="bbs_manage_list.jsp"
				onFocus="this.blur();">게시판 관리</a>
				<ul>
					<li><a href="bbs_manage.jsp?b_id=list&nowPage=1">게시물통합관리</a></li>
					<li><a href="bbs_manage.jsp?b_id=comment">코멘트통합관리</a></li>
					<li><a href="bbs_connect.jsp">게시판통계</a></li>
				</ul></li>
			<li class="on"><a href="#">게시판목록</a></li>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td height="20" style="padding-left: 15px"><b>커뮤니티 </b></td>
				</tr>
				<tr>
					<td height="20" style="padding: 7px 0 0 22px; color: #777777;"><img
						src="../image/left_s_arrow.gif" align="absmiddle"><a
						href="bbs_list.jsp?b_id=free&nowPage=">공지사항</a></td>
				</tr>
				<tr>
					<td height="20" style="padding: 7px 0 0 22px; color: #777777;"><img
						src="../image/left_s_arrow.gif" align="absmiddle"><a
						href="bbs_list.jsp?b_id=photo&nowPage=">이벤트</a></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>
					<td height="20" style="padding-left: 15px"><b>고객지원 </b></td>
				</tr>
				<tr>
					<td height="20" style="padding: 7px 0 0 22px; color: #777777;"><img
						src="../image/left_s_arrow.gif" align="absmiddle"><a
						href="bbs_list.jsp?b_id=response&nowPage=">응답게시판</a></td>
				</tr>
				<tr>
					<td height="20" style="padding: 7px 0 0 22px; color: #777777;"><img
						src="../image/left_s_arrow.gif" align="absmiddle"><a
						href="bbs_list.jsp?b_id=qna&nowPage=">질문답변</a></td>
				</tr>
			</table>
		</ul>

	</div>
	<!-- //left_area// -->
</body>
</html>