<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
</head>
<body class="home_body">
	<!-- 헤드부분 -->
	<%@include file="../include/head.jsp"%>




	<div id="Container_wrap" class="right_close">

		<div class="nav_handle_left">
			<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
		</div>

		<%@include file="../include/bbs_left.jsp" %>

		<div id="Container">

			<script language="JavaScript" type="text/javascript">
			<!--
				function deleteBbs(code) {
					if (code == "qna" || code == "review") {
						alert("해당 게시판은 삭제할 수 없습니다.");
					} else {
						if (confirm('선택한 게시판을 삭제하시겠습니까?\n\n삭제한 데이타는 복구할수 없습니다.')) {
							document.location = 'bbs_savea6d3.html?mode=delete&amp;code='
									+ code + '&page=';
						}
					}
				}
			//-->
			</script>

			<div id="location">HOME > 게시판관리</div>
			<div id="S_contents">
				<h3>
					게시판관리<span>게시판을 추가/삭제, 상세기능을 설정합니다.</span>
				</h3>


				<form name="frm"
					action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs_list.php"
					method="get">
					<table width="100%" cellspacing="0" cellpadding="0" border="0"
						class="table_basic">
						<tr>
							<th width="15%">게시판 검색</th>
							<td width="85%"><select name="grp">
									<option value="">::그룹선택::</option>
									<option value="1">커뮤니티</option>
									<option value="2">고객지원</option>
							</select> <input type="text" name="searchkey" value="" class="input">
								<button style="height: 22px; vertical-align: bottom;"
									type="submit" class="b h30 t5 color blue_big">검색</button></td>
						</tr>
					</table>
				</form>


				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="top10">
					<tr>
						<td>총 게시판수 : <b>24</b></td>
						<td align="right"></td>
					</tr>
				</table>
				<div class="col_table_margin"></div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="bbs_basic_list">
					<thead>
						<tr>
							<td width="8%">번호</td>
							<td width="8%">그룹명</td>
							<td width="8%">영문명</td>
							<td>게시판명</td>
							<td width="8%">스킨</td>
							<td width="8%">목록보기</td>
							<td width="8%">내용보기</td>
							<td width="8%">글쓰기</td>
							<td width="8%">답글쓰기</td>
							<td width="8%">코멘트쓰기</td>
							<td width="10%">기능</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="30" align="center">24</td>
							<td align="center"><a
								href="bbs_inputda9d.html?mode=update&amp;code=bbsBasic&amp;page=1">커뮤니티
							</a></td>
							<td align="center"><a
								href="bbs_inputda9d.html?mode=update&amp;code=bbsBasic&amp;page=1">bbsBasic</a></td>
							<td align="center"><a
								href="bbs_inputda9d.html?mode=update&amp;code=bbsBasic&amp;page=1">자유게시판</a></td>
							<td align="center">bbsBasic</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">
								<button type="button" class="h18 t3 color small round red_s"
									onclick="location.href='bbs_inputda9d.html?mode=update&amp;code=bbsBasic&amp;page=1'">수정</button>
								<button type="button" class="h18 t3 color small round black_s"
									onClick="deleteBbs('bbsBasic');">삭제</button>
							</td>
						</tr>
						<tr>
							<td height="30" align="center">12</td>
							<td align="center"><a
								href="bbs_input6483.html?mode=update&amp;code=photoBasic&amp;page=1">커뮤니티
							</a></td>
							<td align="center"><a
								href="bbs_input6483.html?mode=update&amp;code=photoBasic&amp;page=1">photoBasic</a></td>
							<td align="center"><a
								href="bbs_input6483.html?mode=update&amp;code=photoBasic&amp;page=1">갤러리1</a></td>
							<td align="center">photoBasic</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">
								<button type="button" class="h18 t3 color small round red_s"
									onclick="location.href='bbs_input6483.html?mode=update&amp;code=photoBasic&amp;page=1'">수정</button>
								<button type="button" class="h18 t3 color small round black_s"
									onClick="deleteBbs('photoBasic');">삭제</button>
							</td>
						</tr>

						<tr>
							<td height="30" align="center">11</td>
							<td align="center"><a
								href="bbs_input7756.html?mode=update&amp;code=answerBasic&amp;page=1">커뮤니티
							</a></td>
							<td align="center"><a
								href="bbs_input7756.html?mode=update&amp;code=answerBasic&amp;page=1">answerBasic</a></td>
							<td align="center"><a
								href="bbs_input7756.html?mode=update&amp;code=answerBasic&amp;page=1">응답게시판</a></td>
							<td align="center">answerBasic</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">
								<button type="button" class="h18 t3 color small round red_s"
									onclick="location.href='bbs_input7756.html?mode=update&amp;code=answerBasic&amp;page=1'">수정</button>
								<button type="button" class="h18 t3 color small round black_s"
									onClick="deleteBbs('answerBasic');">삭제</button>
							</td>
						</tr>

						<tr>
							<td height="30" align="center">10</td>
							<td align="center"><a
								href="bbs_input3461.html?mode=update&amp;code=qna&amp;page=1">고객지원
							</a></td>
							<td align="center"><a
								href="bbs_input3461.html?mode=update&amp;code=qna&amp;page=1">qna</a></td>
							<td align="center"><a
								href="bbs_input3461.html?mode=update&amp;code=qna&amp;page=1">질문답변</a></td>
							<td align="center">bbsBasic</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">전체</td>
							<td align="center">
								<button type="button" class="h18 t3 color small round red_s"
									onclick="location.href='bbs_input3461.html?mode=update&amp;code=qna&amp;page=1'">수정</button>
								<button type="button" class="h18 t3 color small round black_s"
									onClick="deleteBbs('qna');">삭제</button>
							</td>
						</tr>

						<tr>
					</tbody>
				</table>

				<div>
					<table width='100%' border='0' cellspacing='0' cellpadding='0'>
						<tr>
							<td align='center'>
								<table border='0' cellspacing='0' cellpadding='0'>
									<tr>
										<td width='22' height='50'><a
											href='bbs_list6e20.html?ptype=&amp;page=1'><img
												src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>
										<td width='22'><a
											href='bbs_list6e20.html?ptype=&amp;page=1'><img
												src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>
										<td align='center'>&nbsp; <b>1</b> / &nbsp;
										</td>
										<td width='22' align='right'><a
											href='bbs_list6e20.html?ptype=&amp;page=1'><img
												src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>
										<td width='22' align='right'><a
											href='bbs_list6e20.html?ptype=&amp;page=1'><img
												src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<!-- //Container// -->
	</div>
	<!-- //Container_wrap// -->

	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>