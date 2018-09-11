<%@page import="util.PagingUtil"%>
<%@page import="dto.CommDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//커넥션풀로 변경
	BbsDAO dao = new BbsDAO();

	//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
	Map<String, Object> param = new HashMap<String, Object>();

	String queryStr = "";
	//폼값받기(검색관련)
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	if (searchWord != null) {
		//입력한 검색어가 있다면 맵에 추가함
		param.put("Column", searchColumn);
		param.put("Word", searchWord);

		//파라미터 추가
		queryStr += String.format("&searchColumn=%s" + "&searchWord=%s&", searchColumn, searchWord);
	}

	//페이지 처리를 위한 로직 시작
	//1.게시판 테이블의 전체 레코드 갯수 구하기
	int totalRecordCount = dao.getTotalComm(param);

	//2.페이지에 나올수 설정
	int pageSize = 10;
	int blockPage = 5;

	//3.전체페이지수 계산하기
	int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	//4.페이지번호가 없는경우 무조건 1로 설정
	int nowPage = (request.getParameter("nowPage") == "") ? 1
			: Integer.parseInt(request.getParameter("nowPage"));

	//5.가져올 레코드의 구간을 결정하기 위한 연산
	int start = (nowPage - 1) * pageSize + 1;
	int end = nowPage * pageSize;

	//6.파라미터 전달을 위해 map에 추가
	param.put("start", start);
	param.put("end", end);

	/////게시판 페이지 처리 로직 끝
	List<CommDTO> bbs = dao.commentTotalList(param); 
	dao.close();

	String url = request.getRequestURI() + "?b_id=list&";
	String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
			url + queryStr);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
<link rel="stylesheet" href="../common/bootstrap3.3.7/css/bootstrap.min.css" />
<script src="../common/bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="location">HOME > 코멘트 통합관리</div>
	<div id="S_contents">
		<h3>
			코멘트 통합관리<span>생성된 게시판의 코멘트들을 통합하여 관리합니다.</span>
		</h3>


		<form name="frm" action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs_manage_comment.php" method="get">
			<input type="hidden" name="ptype" value="reply">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
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
					<td class="tdlast">
						<select name="searchopt" class="select w80">
							<option value="content">코멘트내용
							<option value="name">작성자
						</select>
						<input type="text" name="searchkey" value="" class="input w300">
					</td>
				</tr>
			</table>
			<div class="top15 center">
				<button type="submit" class="b h28 t5 color blue_big">검색하기</button>
			</div>
		</form>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					코멘트수 : <b>7</b>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list">
			<thead>
				<tr>
					<td width="5%"><input type="checkbox" name="select_all" onClick="selectAll(this.form, this)"></td>
					<td width="5%">번호</td>
					<td width="*">코멘트내용</td>
					<td width="10%">작성자</td>
					<td width="8%">작성일</td>
					<td width="50">수정</td>
					<td width="50">삭제</td>
				</tr>
			</thead>
			<tbody>
				<!-- 댓글리스트 반복 -->
<%
	for (CommDTO dto : bbs) {
%>
				<tr>

					<td align="center"><input type="checkbox" name="select_checkbox" value="<%=dto.getCom_idx()%>"></td>
					<td height="30" align="center"><%=dto.getCom_idx()%></td>
					<td style="text-align: left;">
						<a href="javascript:bbsView('5318', 'notice');" style="cursor: point"><%=dto.getCom_content() %></a>
					</td>
					<td align="center"><%=dto.getCom_name() %></td>
					<td align="center"><%=dto.getCom_regidate() %></td>
					<td align="center">
						<a onclick="commentModify('35', 'notice');"><button type="button" class="h18 t3 color small round black_s">수정</button></a>
					</td>
					<td align="center">
						<button type="button" class="h18 t3 color small round red_s" onClick="deleteBbsComment('35', '5318');">삭제</button>
					</td>
				</tr>
				<%} %>
				<!-- 댓글리스트 끝 -->
			</tbody>
		</table>

		<table width='100%' border='0' cellspacing='0' cellpadding='0'>
			<tr>
				<td align='center'>
					<table border='0' cellspacing='0' cellpadding='0'>
						<tr>
							<td width='22' height='50'>
								<%=pagingImg%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</body>
</html>