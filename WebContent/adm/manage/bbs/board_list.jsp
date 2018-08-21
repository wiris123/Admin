<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
</head>
<body>
	<script Language="JavaScript" src="../../js/lib.js"></script>
	<link href="../../bbs/skin/bbsBasic/style.css" rel="stylesheet"
		type="text/css">

	<table width="100%" border="0" cellpadding="0" cellspacing="0"
		style="border-top: 1px solid #333;">
		<tr style="background: #f7f7f7;">
			<th width="8%" height="38">번호</th>
			<th width="*">제목</th>
			<th width="12%">작성자</th>
			<th width="12%">작성일</th>
			<th width="8%">조회</th>
			<th width="8%">추천</th>

		</tr>
		<tr>
			<td colspan="10" height="1" bgcolor="#d7d7d7"></td>
		</tr>

		<!-- 리스트 반복 -->
		<tr style="">
			<td align="center" height="38">2</td>
			<td align="left" style="padding-left: 10px; word-break: break-all;"><a
				href='freeboard.jsp?ptype=view&amp;idx=5275&amp;page=1&amp;code=bbsBasic'>[카테고리1]
					게시물 테스트 입니다. 게시물 테스트 입니다. ...</a> (1)</td>
			<td align="center">홈페이지</td>
			<td align="center">2016/04/11</td>
			<td align="center">8</td>
			<td align="center">0</td>
		</tr>
		<tr>
			<td colspan="10" height="1" bgcolor="#d7d7d7"></td>
		</tr>
		<!-- 리스트 반복 끝 -->

	</table>
	<!-- 게시물 끝 -->
	<!-- 페이지 번호 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="50" align="center" class="Paging_Num">
				<table width='100%' border='0' cellspacing='0' cellpadding='0'>
					<tr>
						<td align='center'>
							<table border='0' cellspacing='0' cellpadding='0'>
								<tr>
									<td width='22' height='50'><a
										href='bbsef31.html?ptype=view&amp;page=1&amp;code=bbsBasic&amp;idx=5279'><img
											src='../../bbs/skin/bbsBasic/image/btn_prev2.gif'
											align='absmiddle' border=0'></a></td>
									<td width='22'><a
										href='bbsef31.html?ptype=view&amp;page=1&amp;code=bbsBasic&amp;idx=5279'><img
											src='../../bbs/skin/bbsBasic/image/btn_prev.gif'
											align='absmiddle' border=0'></a></td>
									<td align='center'>&nbsp; <b>1</b> / &nbsp;
									</td>
									<td width='22' align='right'><a
										href='bbsef31.html?ptype=view&amp;page=1&amp;code=bbsBasic&amp;idx=5279'><img
											src='../../bbs/skin/bbsBasic/image/btn_next.gif'
											align='absmiddle' border='0'></a></td>
									<td width='22' align='right'><a
										href='bbsef31.html?ptype=view&amp;page=1&amp;code=bbsBasic&amp;idx=5279'><img
											src='../../bbs/skin/bbsBasic/image/btn_next2.gif'
											align='absmiddle' border='0'></a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<!-- 페이지 번호끝 -->

	<!-- 검색 -->
	<div class="AWbbs_f_search">
		<form name="sfrm"
			action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs.php">
			<table width="0%" border="0" cellpadding="0" cellspacing="0"
				align="center">

				<input type="hidden" name="code" value="bbsBasic">
				<input type="hidden" name="category" value="">
				<tr>
					<td>
						<select name="searchopt" style="height: 28px;">
								<option value="subject">제 목</option>
								<option value="content">내 용</option>
								<option value="subcon">제목 + 내용</option>
								<option value="name">작성자</option>
								<option value="memid">아이디</option>
						</select>
					</td>
					<td><input name="searchkey" type="text" value="" /></td>
					<td><button type="submit">
							<img src="../../bbs/skin/bbsBasic/image/btn_search.gif" />
						</button></td>
				</tr>

			</table>
		</form>
	</div>
	<!-- 검색 끝 -->
	<!-- 버튼 -->
	<div style="margin: 10px 0 0;">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right"><a
					href='bbs427d.html?ptype=input&amp;mode=insert&amp;code=bbsBasic'><img
						src='../../bbs/skin/bbsBasic/image/btn_write.gif' border='0'></a></td>
			</tr>
		</table>
	</div>
	<!-- 버튼 끝 -->
	</td>
	</tr>
	</table>
</body>
</html>