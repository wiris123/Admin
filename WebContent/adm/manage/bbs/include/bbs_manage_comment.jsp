<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
<link rel="stylesheet"
	href="../common/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
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
</body>
</html>