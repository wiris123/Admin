<%@page import="util.PagingUtil"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	int totalRecordCount = dao.getTotalCount(param);

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
	List<BoardDTO> bbs = dao.selectTotalList(param);
	dao.close();

	String url = request.getRequestURI() + "?b_id=list&";

	String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
			url + queryStr);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 통합관리</title>
</head>
<body>
	<div id="location">HOME > 게시물 통합관리</div>
	<div id="S_contents">
		<h3>
			게시물 통합관리<span>생성된 게시판의 게시글들을 통합하여 관리합니다.</span>
		</h3>

		<form name="frm" action="./proc/bbs_manage_list.jsp" method="get">
			<input type="hidden" name="ptype" value="bbs">

			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
				<tr>
					<th width="15%">게시판별 보기</th>
					<td width="85%">
						<select name="searchBoard" onchange="this.form.submit();">
							<option value="">:: 전체 ::</option>
							<option value=""><b>커뮤니티 </b></option>
							<option value="bbsBasic">&nbsp;&nbsp;자유게시판</option>
							<option value="photoBasic">&nbsp;&nbsp;갤러리1</option>
							<option value="answerBasic">&nbsp;&nbsp;응답게시판</option>
							<option value=""><b>고객지원 </b></option>
							<option value="qna">&nbsp;&nbsp;질문답변</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="tdlast">키워드검색</th>
					<td class="tdlast">
						<select name="searchColumn" class="select w80">
							<option value="subject">제목</option>
							<option value="content">내용
							<option value="name">작성자
						</select>
						<input type="text" name="searchWord" value="" class="input w300">
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
					게시글수 : <b>102</b>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list">
			<thead>
				<tr>
					
					<td width="5%">번호</td>
					<td>글제목</td>
					<td width="10%">작성자</td>
					<td width="8%">작성일</td>
					<td width="5%">조회수</td>
					<td width="50">수정</td>
					<td width="50">삭제</td>
				</tr>
			</thead>
			<!-- 게시글 반복 시작 -->
			<%
				for (BoardDTO dto : bbs) {
			%>
			<tbody>
				<tr>
					<td height="30" align="center"><%=dto.getNum()%></td>
					<td style="text-align: left;">
						<a href="./bbs_contents.jsp?b_id=<%=dto.getB_id() %>&num=<%=dto.getNum() %>&nowPage=" style="cursor: point"><b>[<%=dto.getB_name() %>]</b>&nbsp;<%=dto.getTitle()%> </a>
					</td>
					<td align="center"><%=dto.getName()%></td>
					<td align="center"><%=dto.getRegidate()%></td>
					<td align="center"><%=dto.getViewcnt()%></td>
					<td align="center">
						<a onclick="bbsModify('5360', 'myBasic');"><button type="button" class="h18 t3 color small round black_s">수정</button></a>
					</td>
					<td align="center">
						<button type="button" class="h18 t3 color small round red_s" onClick="deleteBbs('myBasic', '5360');">삭제</button>
					</td>
				</tr>
			</tbody>
			<%
				}
			%>
			<!-- 게시글 반복 끝 -->
		</table>
		<!-- 페이지처리 -->
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
	</div>
	<!-- 페이지처리 끝 -->
</body>
</html>