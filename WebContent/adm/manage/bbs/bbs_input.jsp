<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정페이지</title>
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
		
				function inputCheck(frm) {

					if (frm.code.value == "") {
						alert('게시판 영문명(db명)을 입력하세요.');
						frm.code.focus();
						return false;
					} else if (!check_Char(frm.code.value)) {
						alert('게시판 영문명(db명)은 특수문자를 사용할 수 없습니다.');
						frm.code.focus();
						return false;
					}

					if (frm.title.value == "") {
						alert('게시판 한글명 입력하세요.');
						frm.title.focus();
						return false;
					}

					if (frm.rows.value == "") {
						alert('페이지출력수 입력하세요.');
						frm.rows.focus();
						return false;
					}
					if (frm.lists.value == "") {
						alert('리스트출력수 입력하세요.');
						frm.lists.focus();
						return false;
					}

					if (frm.rows.value != "" && !check_Num(frm.rows.value)) {
						alert("페이지출력수는 숫자만 입력하세요.");
						frm.rows.focus();
						return false;
					}
					if (frm.lists.value != "" && !check_Num(frm.lists.value)) {
						alert("리스트출력수는 숫자만 입력하세요.");
						frm.lists.focus();
						return false;
					}
					if (frm.newc.value != "" && !check_Num(frm.newc.value)) {
						alert("new 기간설정은 숫자만 입력하세요.");
						frm.newc.focus();
						return false;
					}
					if (frm.hotc.value != "" && !check_Num(frm.hotc.value)) {
						alert("hot 조회수설정은 숫자만 입력하세요.");
						frm.hotc.focus();
						return false;
					}
					if (frm.subject_len.value != ""
							&& !check_Num(frm.subject_len.value)) {
						alert("제목 글자수는 숫자만 입력하세요.");
						frm.subject_len.focus();
						return false;
					}
					if (frm.line.value != "" && !check_Num(frm.line.value)) {
						alert("줄바꿈 게시물수는 숫자만 입력하세요.");
						frm.line.focus();
						return false;
					}

				}

				function popCategory() {
					var url = "categorye460.html?code=photoList2";
					window
							.open(
									url,
									"popCategory",
									"height=400, width=750, menubar=no, scrollbars=yes, resizable=yes, toolbar=no, status=no, top=100, left=100");
				}

				function popGrp() {
					var url = "group.html";
					window
							.open(
									url,
									"popGrp",
									"height=300, width=450, menubar=no, scrollbars=yes, resizable=yes, toolbar=no, status=no, top=100, left=100");
				}
		
			</script>

			<div id="location">HOME > 게시판관리</div>
			<div id="S_contents">
				<h3>
					게시판관리<span>게시판을 추가/삭제, 상세기능을 설정합니다.</span>
				</h3>

				<form name="frm"
					action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs_save.php"
					method="post" enctype="multipart/form-data"
					onSubmit="return inputCheck(this);">
					<input type="hidden" name="mode" value="update"> <input
						type="hidden" name="page" value="1">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="table_basic">
						<tr>
							<th height="10" align="left">영문명(db명) <font color=red>*</font></th>
							<td colspan="3"><input name="code" type="text" size="30"
								value="photoList2" maxlength="30" readonly class="input"></td>
						</tr>
						<tr>
							<th height="10" align="left">한글명 <font color=red>*</font></th>
							<td colspan="3"><input name="title" type="text" size="30"
								value="갤러리4" class="input"></td>
						</tr>
						<!--
            <tr>
              <th height="10" align="left">게시판주소 <font color=red>*</font></th>
              <td colspan="3">http://demohome.anywiz.co.kr/<input name="pageurl" type="text" size="32" value="" class="input"></td>
            </tr>
            <tr>
              <th height="10" align="left">타이들이미지</th>
              <td colspan="3">
                            <input name="titleimg" type="file" size="30" class="input">
              </td>
            </tr>
            <tr>
              <th height="10" align="left">상단파일</th>
              <td colspan="3"><input name="header" type="text" size="30" value="" class="input"></td>
            </tr>
            <tr>
              <th height="10" align="left">하단파일</th>
              <td colspan="3"><input name="footer" type="text" size="30" value="" class="input"></td>
            </tr>
            <tr>
              <th height="10" align="left">카테고리</th>
              <td colspan="3">쉼표로 분리 예)공지,분류1,분류2<br><input name="category" type="text" size="60" value="" class="input"></td>
            </tr>
            -->
						<tr>
							<th height="10" align="left">게시판그룹</th>
							<td colspan="3"><select name="grp" id="bbs_grp">
									<option value="">:: 게시판그룹 ::</option>
									<option value="1" selected>커뮤니티</option>
									<option value="2">고객지원</option>
									<option value="3">제품소개</option>
									<option value="4">쇼핑몰</option>
							</select>
								<button type="button" class="h18 t3 color small round black_s"
									onclick="popGrp()">그룹관리</button> 우선순위 <select name="prior">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
							</select> (그룹내에서 게시판 우선순위,작을수록 순위가 높음)<br> 게시판그룹은 게시판이 많은 경우 게시판을
								그룹별로 효과적으로 관리하기 위한 기능입니다.</td>
						</tr>
						<tr>
							<th height="10" align="left">카테고리</th>
							<td colspan="3"><select name="bbs_cat">
									<option value="">:: 카테고리 ::</option>
									<option value="78">전체</option>
							</select>
								<button type="button" class="h18 t3 color small round black_s"
									onclick="popCategory()">카테고리관리</button></td>
						</tr>
						<tr>
							<th height="10" align="left">게시판관리자</th>
							<td colspan="3">아이디를 쉼표로 분리 예)admin,admin1,admin3<br> <input
								name="bbsadmin" type="text" size="60" value="" class="input"></td>
						</tr>
						<tr>
							<th width="15%" height="10" align="left">자동 비밀글</th>
							<td width="35%"><input type="checkbox" name="privacy"
								value="Y">작성자와 운영자만 연람가능</td>
							<th width="15%" height="10" align="left">게시판스킨</th>
							<td width="35%">
								<table>
									<tr>
										<td>PC :</td>


										<td><select name="skin">
												<option value="answerBasic">answerBasic</option>
												<option value="bbsAgree">bbsAgree</option>
												<option value="bbsBasic">bbsBasic</option>
												<option value="bbsEng">bbsEng</option>
												<option value="faqBasic">faqBasic</option>
												<option value="guestBasic">guestBasic</option>
												<option value="mapBasic">mapBasic</option>
												<option value="medicBasic">medicBasic</option>
												<option value="myBasic">myBasic</option>
												<option value="photoBasic">photoBasic</option>
												<option value="photoBasic2">photoBasic2</option>
												<option value="photoList">photoList</option>
												<option value="photoList2">photoList2</option>
												<option value="prdBasic">prdBasic</option>
												<option value="reserveBasic">reserveBasic</option>
												<option value="thumbBasic">thumbBasic</option>
												<option value="thumbBasic2">thumbBasic2</option>
												<option value="thumbBasic3">thumbBasic3</option>
										</select></td>
										<td>모바일 :</td>
										<td><select name="skin_mobile">
												<option value="">사용안함</option>
												<option value="bbsBasic">bbsBasic</option>
												<option value="photoBasic">photoBasic</option>
												<option value="prdBasic">prdBasic</option>
										</select></td>


									</tr>

								</table>
							</td>



						</tr>
						<tr>
							<th height="10" align="left">이미지파일</th>
							<td colspan="3"><input type="checkbox" name="imgview"
								value="N">첨부파일이 이미지인 경우 보기 페이지에서 이미지 감추기</td>
						</tr>
						<tr>
							<th height="10" align="left">이미지 첨부파일 정렬</th>
							<td colspan="3"><input type="radio" name="img_align"
								value="LEFT" checked> 좌측정렬 <input type="radio"
								name="img_align" value="CENTER"> 중앙정렬 <input
								type="radio" name="img_align" value="RIGHT"> 우측정렬</td>
						</tr>
						<tr>
							<th height="10" align="left">SMS 발송</th>
							<td colspan="3"><input type="checkbox" name="sms" value="Y">
								글작성 시 관리자에게 SMS 발송 (기본설정 > 사이트 정보 > 관리자 휴대폰)</td>
						</tr>
						<tr>
							<th height="10" align="left">보기 하단에 목록보기</th>
							<td colspan="3"><input type="radio" name="view_list"
								value="Y"> 사용 <input type="radio" name="view_list"
								value="N" checked> 미사용</td>
						</tr>
						<tr>
							<th height="10" align="left">스팸글체크기능</th>
							<td><input type="radio" name="spam_check" value="Y" checked>
								사용 <input type="radio" name="spam_check" value="N"> 미사용
							</td>
							<th align="left">글쓴이 형식</th>
							<td><select name="name_type">
									<option value="name">이름만 사용</option>
									<option value="nick">닉네임만 사용</option>
									<option value="icon">아이콘만 사용</option>
									<option value="iname">아이콘+이름 사용</option>
									<option value="inick">아이콘+닉네임 사용</option>
							</select> <script language="javascript">
							<!--
								name_type = document.frm.name_type;
								for (ii = 0; ii < name_type.length; ii++) {
									if (name_type.options[ii].value == "name")
										name_type.options[ii].selected = true;
								}
								-->
							</script></td>
						</tr>
						<tr>
							<th height="10" align="left">날짜형식(목록페이지)</th>
							<td><select name=datetype_list>
									<option value="">:: 목록페이지 ::</option>
									<option value="%y.%m.%d">18.08.08</option>
									<option value="%y/%m/%d">18/08/08</option>
									<option value="%y-%m-%d">18-08-08</option>
									<option value="%Y.%m.%d">2018.08.08</option>
									<option value="%Y/%m/%d">2018/08/08</option>
									<option value="%Y-%m-%d">2018-08-08</option>
									<option value="%Y년 %m월 %d일">2018년 08월 08일</option>
									<option value="%Y-%m-%d %H:%i">2018-08-08 18:06</option>
									<option value="%Y-%m-%d %H:%i %p">2018-08-08 06:06 PM</option>
									<option value="%Y.%m.%d %H:%i:%s">2018.08.08 18:06:28</option>
							</select> <script language="javascript">
							<!--
								datetype_list = document.frm.datetype_list;
								for (ii = 0; ii < datetype_list.length; ii++) {
									if (datetype_list.options[ii].value == "")
										datetype_list.options[ii].selected = true;
								}
								-->
							</script></td>
							<th height="10" align="left">날짜형식(보기페이지)</th>
							<td><select name=datetype_view>
									<option value="">:: 보기페이지 ::</option>
									<option value="%y.%m.%d">18.08.08</option>
									<option value="%y/%m/%d">18/08/08</option>
									<option value="%y-%m-%d">18-08-08</option>
									<option value="%Y.%m.%d">2018.08.08</option>
									<option value="%Y/%m/%d">2018/08/08</option>
									<option value="%Y-%m-%d">2018-08-08</option>
									<option value="%Y년 %m월 %d일">2018년 08월 08일</option>
									<option value="%Y-%m-%d %H:%i">2018-08-08 18:06</option>
									<option value="%Y-%m-%d %H:%i %p">2018-08-08 06:06 PM</option>
									<option value="%Y.%m.%d %H:%i:%s">2018.08.08 18:06:28</option>
							</select> <script language="javascript">
							<!--
								datetype_view = document.frm.datetype_view;
								for (ii = 0; ii < datetype_view.length; ii++) {
									if (datetype_view.options[ii].value == "")
										datetype_view.options[ii].selected = true;
								}
								-->
							</script></td>
						</tr>
						<tr>
							<th align="left">웹에디터</th>
							<td><input type="radio" name="editor" value="Y" checked>사용함
								<input type="radio" name="editor" value="N">사용안함</td>
							<th align="left">답글 메일알림</th>
							<td><input type="radio" name="remail" value="Y">허용함
								<input type="radio" name="remail" value="N" checked>허용안함
							</td>
						</tr>
						<tr>
							<th align="left">추천기능</th>
							<td><input type="radio" name="recom" value="Y">사용함 <input
								type="radio" name="recom" value="N" checked>사용안함</td>
							<th align="left">코멘트 허용</th>
							<td><input type="radio" name="comment" value="Y">허용함
								<input type="radio" name="comment" value="N" checked>허용안함
							</td>
						</tr>
						<tr>
							<th align="left">파일업로드</th>
							<td><select name="upfile">
									<option value="0">사용안함</option>
									<option value="1">1개</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
									<option value="4">4개</option>
									<option value="5">5개</option>
							</select> <script language="javascript">
							<!--
								upfile = document.frm.upfile;
								for (ii = 0; ii < upfile.length; ii++) {
									if (upfile.options[ii].value == "5")
										upfile.options[ii].selected = true;
								}
								-->
							</script></td>
							<th align="left">동영상</th>
							<td><select name="movie">
									<option value="0">사용안함</option>
									<option value="1">1개</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
							</select> <script language="javascript">
							<!--
								movie = document.frm.movie;
								for (ii = 0; ii < movie.length; ii++) {
									if (movie.options[ii].value == "0")
										movie.options[ii].selected = true;
								}
								-->
							</script></td>
						</tr>
						<tr>
							<th align="left">페이지출력수 <font color=red>*</font></th>
							<td><input name="rows" type="text" value="20" class="input"></td>
							<th align="left">리스트출력수 <font color=red>*</font></th>
							<td><input name="lists" type="text" value="5" class="input"></td>
						</tr>
						<tr>
							<th align="left">new 기간설정</th>
							<td><input name="newc" type="text" value="2" class="input"></td>
							<th align="left">hot 조회수설정</th>
							<td><input name="hotc" type="text" value="600" class="input"></td>
						</tr>
						<tr>
							<th align="left">제목 글자수</th>
							<td><input name="subject_len" type="text" value="0"
								class="input"></td>
							<th align="left">줄바꿈 게시물수</th>
							<td><input name="line" type="text" value="4" class="input"><br>(포토갤러리
								형식 스킨인 경우 적용)</td>
						</tr>
						<tr>
							<th height="10" align="left">욕설,비방글 필터링</th>
							<td colspan="3"><input type="checkbox" name="abuse"
								value="Y">사용함 &nbsp; (공백없이 단어를 입력하시고, 단어와 단어사이에는 콤마(,)로
								구분하세요.)<br> <textarea name="abtxt" rows="3" cols="80"
									class="textarea"></textarea></td>
						</tr>
					</table>
					<br>


					<div class="top10 center">
						<button style="border: 0" type="submit"
							class="b h28 t5 color blue_big">확인</button>
						&nbsp;
						<button style="border: 0" type="button"
							class="b h28 t5 color gray_big"
							onClick="document.location='bbs_list2679.html?page=1';">목록</button>
					</div>
				</form>

				<div class="graybox top50">
					<p class="question">체크사항</p>
					<div class="top10 font11 line2 colorgray">
						- 영문명은 반드시 영문으로 작성하고 변경이 불가합니다.<br> - 권한설정은 각 상황별 회원분류에따라
						접근권한을 설정합니다.<br> - 욕설,비방글 설정을 통하여 글 작성시 욕설 비방글을 방지할 수 있습니다.<br>
						- 제목 글자수는 게시판 목록에서 보여지는 제목의 글자수를 지정하며 그 이상은 ... 으로 표시됩니다.<br>
						- 제목 글자수를 지정하지 않거나 0인 경우에는 글자수 노출에 제한이 없습니다.<br> - 줄바꿈 게시물수는
						게시판 스킨이 포토갤러리 형식인 경우 한 줄에 나오는 게시물 수를 지정합니다.<br> - 줄바꿈 게시물수를
						지정하지 않거나 0인 경우에는 적용되지 않습니다.<br>
					</div>
				</div>



			</div>
		</div>
		<!-- //Container// -->
	</div>
	<!-- //Container_wrap// -->

	<div id="Footer">Copyright ⓒ 2016 Insurance & Saving Management  All rights reserved.</div>
</body>
</html>