<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
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

		<%@include file="../include/bbs_left.jsp"%>
		<div id="Container">

			<script language="JavaScript" type="text/javascript">
			<!--
				function excelDown() {

					document.location = "%b0%d4%bd%c3%b9%b0%b8%f1%b7%cf%5b20180808%5d88fd.xls?searchopt=&amp;searchkey=&amp;codeopt=&amp;sdate=&amp;edate=";

				}
				function deleteBbsComment(idx, cidx) {
					if (confirm('선택한 코멘트를 삭제하시겠습니까?\n\n삭제한 데이터는 복구할수 없습니다.')) {
						//document.location = 'bbs_save.php?mode=delete&code=' + code + '&page=';
						document.location = 'bbs_manage_save7851.html?mode=deletecomment&amp;idx='
								+ idx + '&cidx=' + cidx;
					}
				}
				function bbsView(idx, code) {
					window
							.open("bbse5cd.html?ptype=view&amp;idx=" + idx
									+ "&code=" + code, "getBbs",
									"width=800,height=850,resizable=yes,scrollbars=yes, left=50, top=50");
				}
				function commentModify(idx, code) {
					window
							.open("bbs_comment.jsp?mode=modify&amp;idx=" + idx
									+ "&code=" + code, "getBbs",
									"width=600,height=300,resizable=yes,scrollbars=yes, left=200, top=200");
				}
				function bbsReply(idx, code) {
					window
							.open(
									"bbs8ce0.html?ptype=input&amp;mode=reply&amp;idx="
											+ idx + "&code=" + code, "getBbs",
									"width=800,height=850,resizable=yes,scrollbars=yes, left=50, top=50");
				}

				Date.prototype.yyyymmdd = function() {
					var yyyy = this.getFullYear().toString();
					var mm = (this.getMonth() + 1).toString();
					var dd = this.getDate().toString();

					return yyyy + (mm[1] ? '-' + mm : '-0' + mm[0])
							+ (dd[1] ? '-' + dd : '-0' + dd[0]);
				}
				function setPeriod(pdate) {
					var dt = new Date().yyyymmdd();
					//dt = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate();

					var sdate = document.frm.sdate;
					var edate = document.frm.edate;

					sdate.value = pdate;
					edate.value = dt;

					document.frm.submit();
				}
			//-->
			</script>


			<div id="location">HOME > 코멘트 통합관리</div>
			<div id="S_contents">
				<h3>
					코멘트 통합관리<span>생성된 게시판의 코멘트들을 통합하여 관리합니다.</span>
				</h3>


				<form name="frm"
					action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs_manage_comment.php"
					method="get">
					<input type="hidden" name="ptype" value="reply">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="table_basic">
						<tr>
							<th width="15%">게시판별 보기</th>
							<td width="85%"><select name="codeopt"
								onchange="this.form.submit();">
									<option value="">:: 전체 ::</option>
									<option value="qna">질문답변
									<option value="bbsBasic">자유게시판
									<option value="photoBasic">갤러리
									<option value="answerBasic">응답게시판
							</select></td>
						</tr>
						<!-- 
						등록일을 통한 검색
						<tr>
							<th>등록일</th>
							<td><input class="input w100" type="text" id="datepicker1"
								name="sdate" value=""> <input type="button"
								class="btn_calendar" id="" /> ~ <input class="input w100"
								type="text" id="datepicker2" name="edate" value=""> <input
								type="button" class="btn_calendar" id="" />
								<button type="button" class="h22 small t3 gray_s"
									onclick="setPeriod('2018-08-08')">오늘</button>
								<button type="button" class="h22 small t3 gray_s"
									onclick="setPeriod('2018-08-07')">어제</button>
								<button type="button" class="h22 small t3 gray_s"
									onclick="setPeriod('2018-08-01')">1주일</button>
								<button type="button" class="h22 small t3 gray_s"
									onclick="setPeriod('2018-07-09')">1개월</button></td>
						</tr> -->
						<tr>
							<th class="tdlast">키워드검색</th>
							<td class="tdlast"><select name="searchopt"
								class="select w80">
									<option value="content">코멘트내용
									<option value="name">작성자
							</select> <input type="text" name="searchkey" value="" class="input w300">
							</td>
						</tr>
					</table>
					<div class="top15 center">
						<button type="submit" class="b h28 t5 color blue_big">검색하기</button>
					</div>
				</form>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>코멘트수 : <b>7</b></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="bbs_basic_list">
					<thead>
						<tr>
							<td width="5%">번호</td>
							<td width="7%">코멘트위치</td>
							<td width="*">코멘트내용</td>
							<td width="10%">작성자</td>
							<td width="8%">작성일</td>
							<td width="50">수정</td>
							<td width="50">삭제</td>
						</tr>
					</thead>
					<tbody>
					<!-- 댓글리스트 반복 -->
						<tr>

							<!-- <td align="center"><input type="checkbox" name="select_checkbox" value="35"></td> -->
							<td height="30" align="center">6</td>
							<td align="center">공지사항</td>
							<!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5318', 'notice');">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</a></td> -->
							<td style="text-align: left;"><a
								href="javascript:bbsView('5318', 'notice');"
								style="cursor: point">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</a></td>
							<td align="center">홈페이지</td>
							<td align="center">2016-06-13 10:57:46</td>
							<td align="center"><a
								onclick="commentModify('35', 'notice');"><button
										type="button" class="h18 t3 color small round black_s">수정</button></a></td>
							<td align="center"><button type="button"
									class="h18 t3 color small round red_s"
									onClick="deleteBbsComment('35', '5318');">삭제</button></td>
						</tr>
						<!-- 댓글리스트 끝 -->
					</tbody>
				</table>

				<div class="bbs_button top10">
					<div class="bbs_btn_left">
						<button type='button' class='h22 t4 small icon gray'
							name='select_tmp' onClick='selectAllBbs();'>
							<span class='icon_check'></span>전체선택
						</button>
						<button type='button' class='h22 t4 small icon gray'
							name='select_tmp' onClick='selectCancelBbs();'>
							<span class='icon_minus'></span>전체해제
						</button>
						<button type='button' class='h22 t4 small icon gray'
							onClick="delBbsNewComments('bbs_manage_save.html', '');">
							<span class='icon_x'></span>선택삭제
						</button>
					</div>
				</div>

				<table width="100%" height="10" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td align="center">
							<table width='100%' border='0' cellspacing='0' cellpadding='0'>
								<tr>
									<td align='center'>
										<table border='0' cellspacing='0' cellpadding='0'>
											<tr>
												<td width='22' height='50'><a
													href='bbs_manage_commentabf2.html?ptype=&amp;page=1&amp;searchopt=&amp;searchkey=&amp;codeopt=&amp;sdate=&amp;edate='><img
														src='../image/btn_prev2.gif' align='absmiddle' border=0'></a>

												</td>
												<td width='22'><a
													href='bbs_manage_commentabf2.html?ptype=&amp;page=1&amp;searchopt=&amp;searchkey=&amp;codeopt=&amp;sdate=&amp;edate='><img
														src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>
												<td align='center'>&nbsp; <b>1</b> / &nbsp;
												</td>
												<td width='22' align='right'><a
													href='bbs_manage_commentabf2.html?ptype=&amp;page=1&amp;searchopt=&amp;searchkey=&amp;codeopt=&amp;sdate=&amp;edate='><img
														src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>
												<td width='22' align='right'><a
													href='bbs_manage_commentabf2.html?ptype=&amp;page=1&amp;searchopt=&amp;searchkey=&amp;codeopt=&amp;sdate=&amp;edate='><img
														src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>
											</tr>

										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<div class="graybox top50">
					<p class="question">궁금증 해결!</p>
					<div class="top10 font11 line2 colorgray">
						- 생성된 게시판 별 게시글들의 확인 및 답변, 게시글 작성과 수정 등을 한 화면에서 처리, 관리가 가능합니다.<br />
						- 글 제목을 클릭하시면 해당게시판 설정 페이지가 새창으로 열립니다. 쇼핑몰 사용자의 페이지의 게시판에서도 게시글 확인
						및 댓글남기기 등의 관리가 가능합니다.<br /> - 게시판 이름을 클릭하시면 해당 설정 페이지로 이동합니다. 게시판
						설정 수정이 가능합니다.<br /> - 조회한 게시글 리스트를 엑셀파일로 다운로드 하여 별도의 문서파일로 활용이
						가능합니다.<br /> - 게시글 리스트 엑셀파일 다운로드 시 선택목록 기능은 제공되지 않습니다.
					</div>
				</div>

			</div>
		</div>
		<!-- //Container// -->
	</div>
	<!-- //Container_wrap// -->

	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>