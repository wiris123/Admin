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
							.open("bbs_comment.jsp?mode=modify&amp;idx="
									+ idx + "&code=" + code, "getBbs",
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
									<option value="faq">자주묻는질문
									<option value="bbsBasic">자유게시판
									<option value="movieBasic">동영상
									<option value="mapBasic">대리점안내
									<option value="guestBasic">방명록
									<option value="medicBasic">병원상담
									<option value="myBasic">1:1상담
									<option value="photoBasic2">갤러리2
									<option value="photoList">갤러리3
									<option value="photoList2">갤러리4
									<option value="reserveBasic">예약게시판
									<option value="thumbBasic">썸네일1
									<option value="thumbBasic2">썸네일2
									<option value="thumbBasic3">썸네일3
									<option value="notice">공지사항
									<option value="photoBasic">갤러리1
									<option value="answerBasic">응답게시판
									<option value="prdBasic">제품소개
									<option value="prdBasic2">제품소개2
									<option value="bbsEng">영문게시판
									<option value="prdBasic3">제품소개3
									<option value="bbsAgree">약관동의
							</select></td>
						</tr>
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
						</tr>
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
							<td width="40"><form style='margin: 0;'>
									<input type='checkbox' name='select_tmp'
										onClick='selectReverseBbs(this.form)'>
								</form></td>
							<td width="5%">번호</td>
							<td width="7%">코멘트위치</td>
							<td>코멘트내용</td>
							<td width="10%">작성자</td>
							<td width="8%">작성일</td>
							<td width="8%">IP</td>
							<td width="50">수정</td>
							<td width="50">삭제</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center">
								<form style='margin: 0;'>
									<input type='hidden' name='idx' value='36'> <input
										type='hidden' name='cidx' value='5149'> <input
										type='checkbox' name='select_checkbox'>
								</form>
							</td>
							<!-- <td align="center"><input type="checkbox" name="select_checkbox" value="36"></td> -->
							<td height="30" align="center">7</td>
							<td align="center">질문답변</td>
							<!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5149', 'qna');">  <a href="http://www.jettnjagger.com/insurance-companies-in-nigeria.html">http://www.jettnjagger.com/insurance-companies-in-nigeria.html</a>   <a href="http://www.frenchkissmag.com/gap-auto-insurance.html">http://www.frenchkissmag.com/gap-auto-insurance.html</a>   <a href="http://www.jettnjagger.com/car-insurance-companies-in-austin-tx.html">car insurance companies in austin tx</a> </a></td> -->
							<td style="text-align: left;"><a
								href="javascript:bbsView('5149', 'qna');" style="cursor: point">
									<a
									href="http://www.jettnjagger.com/insurance-companies-in-nigeria.h...</a></td>  <td align="center">Missy</td>
			  <td align="center">2017-04-13 04:00:05</td>
				<td align="center">5.188.211.170</td>
			  <td align="center"><a onclick="commentModify('36', 'qna');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('36', '5149');">삭제</button></td>
		</tr>
     		  	<tr> 
			<td align="center">
				<form style='margin:0;'>
					<input type='hidden' name='idx' value='35'>
					<input type='hidden' name='cidx' value='5318'>
					<input type='checkbox' name='select_checkbox'>
				</form>			</td>
			  <!-- <td align="center"><input type="checkbox" name="select_checkbox" value="35"></td> -->
			  <td height="30" align="center">6</td>
				<td align="center">공지사항</td>
			  <!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5318', 'notice');">댓글입니다.댓글입니다.댓글입니다.댓글입니다.</a></td> -->
			  <td style="text-align:left;"><a href="javascript:bbsView('5318', 'notice');" style="cursor:point" >댓글입니다.댓글입니다.댓글입니다.댓글입니다.</a></td>
			  <td align="center">홈페이지</td>
			  <td align="center">2016-06-13 10:57:46</td>
				<td align="center">211.60.125.186</td>
			  <td align="center"><a onclick="commentModify('35', 'notice');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('35', '5318');">삭제</button></td>
		</tr>
     		  	<tr> 
			<td align="center">
				<form style='margin:0;'>
					<input type='hidden' name='idx' value='32'>
					<input type='hidden' name='cidx' value='5149'>
					<input type='checkbox' name='select_checkbox'>
				</form>			</td>
			  <!-- <td align="center"><input type="checkbox" name="select_checkbox" value="32"></td> -->
			  <td height="30" align="center">5</td>
				<td align="center">질문답변</td>
			  <!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5149', 'qna');">test</a></td> -->
			  <td style="text-align:left;"><a href="javascript:bbsView('5149', 'qna');" style="cursor:point" >test</a></td>
			  <td align="center">이민우</td>
			  <td align="center">2016-05-18 11:29:21</td>
				<td align="center">211.60.125.186</td>
			  <td align="center"><a onclick="commentModify('32', 'qna');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('32', '5149');">삭제</button></td>
		</tr>
     		  	<tr> 
			<td align="center">
				<form style='margin:0;'>
					<input type='hidden' name='idx' value='27'>
					<input type='hidden' name='cidx' value='5284'>
					<input type='checkbox' name='select_checkbox'>
				</form>			</td>
			  <!-- <td align="center"><input type="checkbox" name="select_checkbox" value="27"></td> -->
			  <td height="30" align="center">4</td>
				<td align="center">갤러리2</td>
			  <!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5284', 'photoBasic2');">포토갤러리 코멘트입니다.</a></td> -->
			  <td style="text-align:left;"><a href="javascript:bbsView('5284', 'photoBasic2');" style="cursor:point" >포토갤러리 코멘트입니다.</a></td>
			  <td align="center">포토갤러리</td>
			  <td align="center">2016-05-16 11:57:43</td>
				<td align="center">211.60.125.186</td>
			  <td align="center"><a onclick="commentModify('27', 'photoBasic2');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('27', '5284');">삭제</button></td>
		</tr>
     		  	<tr> 
			<td align="center">
				<form style='margin:0;'>
					<input type='hidden' name='idx' value='16'>
					<input type='hidden' name='cidx' value='5202'>
					<input type='checkbox' name='select_checkbox'>
				</form>			</td>
			  <!-- <td align="center"><input type="checkbox" name="select_checkbox" value="16"></td> -->
			  <td height="30" align="center">3</td>
				<td align="center">예약게시판</td>
			  <!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5202', 'reserveBasic');">댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 
댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. </a></td> -->
			  <td style="text-align:left;"><a href="javascript:bbsView('5202', 'reserveBasic');" style="cursor:point" >댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 
댓...</a></td>
			  <td align="center">홈페이지</td>
			  <td align="center">2016-05-02 15:44:09</td>
				<td align="center">211.60.125.186</td>
			  <td align="center"><a onclick="commentModify('16', 'reserveBasic');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('16', '5202');">삭제</button></td>
		</tr>
     		  	<tr> 
			<td align="center">
				<form style='margin:0;'>
					<input type='hidden' name='idx' value='15'>
					<input type='hidden' name='cidx' value='5202'>
					<input type='checkbox' name='select_checkbox'>
				</form>			</td>
			  <!-- <td align="center"><input type="checkbox" name="select_checkbox" value="15"></td> -->
			  <td height="30" align="center">2</td>
				<td align="center">예약게시판</td>
			  <!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5202', 'reserveBasic');">댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 
댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. </a></td> -->
			  <td style="text-align:left;"><a href="javascript:bbsView('5202', 'reserveBasic');" style="cursor:point" >댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 
댓...</a></td>
			  <td align="center">홈페이지</td>
			  <td align="center">2016-05-02 15:44:06</td>
				<td align="center">211.60.125.186</td>
			  <td align="center"><a onclick="commentModify('15', 'reserveBasic');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('15', '5202');">삭제</button></td>
		</tr>
     		  	<tr> 
			<td align="center">
				<form style='margin:0;'>
					<input type='hidden' name='idx' value='14'>
					<input type='hidden' name='cidx' value='5275'>
					<input type='checkbox' name='select_checkbox'>
				</form>			</td>
			  <!-- <td align="center"><input type="checkbox" name="select_checkbox" value="14"></td> -->
			  <td height="30" align="center">1</td>
				<td align="center">자유게시판</td>
			  <!-- <td align="left"><a href="" style="cursor:point" onclick="bbsView('5275', 'bbsBasic');">댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 
댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. </a></td> -->
			  <td style="text-align:left;"><a href="javascript:bbsView('5275', 'bbsBasic');" style="cursor:point" >댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 댓글 테스트 입니다. 
댓...</a></td>
			  <td align="center">홈페이지</td>
			  <td align="center">2016-05-02 15:43:40</td>
				<td align="center">211.60.125.186</td>
			  <td align="center"><a onclick="commentModify('14', 'bbsBasic');"><button type="button" class="h18 t3 color small round black_s">수정</button></a></td>
			  <td align="center"><button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('14', '5275');">삭제</button></td>
		</tr>
     		  </tbody>
      </table>

		<div class="bbs_button top10">
			<div class="bbs_btn_left">
				<button type='button' class='h22 t4 small icon gray' name='select_tmp' onClick='selectAllBbs();'><span class='icon_check'></span>전체선택</button> <button type='button' class='h22 t4 small icon gray' name='select_tmp' onClick='selectCancelBbs();'><span class='icon_minus'></span>전체해제</button> <button type='button' class='h22 t4 small icon gray' onClick="delBbsNewComments('bbs_manage_save.html', '');"><span class='icon_x'></span>선택삭제</button>		    </div>
		</div>
		
		<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
			<tr> 
				<td align="center">    <table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='bbs_manage_commentabf2.html?ptype=&amp;page=1&amp;searchopt=&amp;searchkey=&amp;codeopt=&amp;sdate=&amp;edate='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>
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