<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리관리</title>
</head>
<body>
	<h3
		style="background: url(../image/sub/h3.gif) left 6px no-repeat; line-height: 1.6; font-size: 16px; font-weight: bold; color: #2f2f2f; padding-left: 16px; font-family: '돋움', 'Dotum', Helvetica;">질문답변</h3>
	<table width="100%" border="0" cellpadding="0" cellspacing="0"
		class="top15">
		<tr>
			<td style="padding: 0px 10px 10px 10px"><script
					Language="JavaScript" src="../../js/lib.js"></script>
				<link href="../../bbs/skin/bbsBasic/style.css" rel="stylesheet"
					type="text/css">
				<!-- 카테고리 -->
				<div class="category_pd"></div> <!-- 카테고리 끝--> <!-- 게시물 시작 -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="border-top: 1px solid #333;">
					<tr style="background: #f7f7f7;">
						<th width="8%" height="38">번호</th>
						<th>제목</th>
						<th width="12%">작성자</th>
						<th width="12%">작성일</th>
						<th width="8%">조회</th>
						<!--        <th width="8%">추천</th>
        -->
					</tr>
					<!-- 게시물반복 -->
					<tr>
						<td colspan="10" height="1" bgcolor="#d7d7d7"></td>
					</tr>
					<tr style="">
						<td align="center" height="38">5</td>
						<td align="left"
							style="padding-left: 10px; word-break: break-all;"><a
							href='bbs0e9b.html?ptype=view&amp;idx=5366&amp;page=1&amp;code=qna'>질문답변
								게시판 입니다.</a></td>
						<td align="center">홈페이지</td>
						<td align="center">2016-05-27</td>
						<td align="center">12</td>
					</tr>
					<!-- 게시물반복끝 -->
					<tr>
						<td colspan="10" height="1" bgcolor="#d7d7d7"></td>
					</tr>
				</table> <!-- 게시물 끝 --> <!-- 페이지 번호 -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="50" align="center" class="Paging_Num">
							<table width='100%' border='0' cellspacing='0' cellpadding='0'>
								<tr>
									<td align='center'>
										<table border='0' cellspacing='0' cellpadding='0'>
											<tr>
												<td width='22' height='50'><a
													href='bbs444c.html?ptype=&amp;page=1&amp;code=qna'><img
														src='../../bbs/skin/bbsBasic/image/btn_prev2.gif'
														align='absmiddle' border=0'></a></td>
												<td width='22'><a
													href='bbs444c.html?ptype=&amp;page=1&amp;code=qna'><img
														src='../../bbs/skin/bbsBasic/image/btn_prev.gif'
														align='absmiddle' border=0'></a></td>
												<td align='center'>&nbsp; <b>1</b> / &nbsp;
												</td>
												<td width='22' align='right'><a
													href='bbs444c.html?ptype=&amp;page=1&amp;code=qna'><img
														src='../../bbs/skin/bbsBasic/image/btn_next.gif'
														align='absmiddle' border='0'></a></td>
												<td width='22' align='right'><a
													href='bbs444c.html?ptype=&amp;page=1&amp;code=qna'><img
														src='../../bbs/skin/bbsBasic/image/btn_next2.gif'
														align='absmiddle' border='0'></a></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table> <!-- 페이지 번호끝 --> <!-- 검색 -->
				<div class="AWbbs_f_search">
					<table width="0%" border="0" cellpadding="0" cellspacing="0"
						align="center">
						<form name="sfrm"
							action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs.php">
							<input type="hidden" name="code" value="qna"> <input
								type="hidden" name="category" value="">
							<tr>
								<td><select name="searchopt" style="height: 28px">
										<option value="subject">제 목</option>
										<option value="content">내 용</option>
										<option value="subcon">제목 + 내용</option>
										<option value="name">작성자</option>
										<option value="memid">아이디</option>
								</select> <script language="javascript">
								<!--
									searchopt = document.sfrm.searchopt;
									for (ii = 0; ii < searchopt.length; ii++) {
										if (searchopt.options[ii].value == "")
											searchopt.options[ii].selected = true;
									}
									-->
								</script></td>
								<td><input name="searchkey" type="text" value="" /></td>
								<td><button type="submit">
										<img src="../../bbs/skin/bbsBasic/image/btn_search.gif" />
									</button></td>
							</tr>
						</form>
					</table>
				</div> <!-- 검색 끝 -->
</body>
</html>