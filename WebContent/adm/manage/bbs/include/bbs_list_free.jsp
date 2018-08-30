<%@page import="util.PagingUtil"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//커넥션풀로 변경
	BbsDAO dao = new BbsDAO();

	//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
	Map<String, Object> param = new HashMap<String, Object>();

	//멀티 게시판 구현[추가]

	String b_id = (request.getParameter("b_id") == "") ? "free" : request.getParameter("b_id");
	param.put("b_id", b_id);
	String queryStr="";
	//문자열 검색 파라미터를 페이지 처리 메소드로 넘겨주기 위한 변수선언
	if(request.getParameter("num")==""){
		queryStr = "b_id=" + b_id + "&";
	}
	else{
		queryStr = "b_id=" + b_id + "&" + "num=" + request.getParameter("num") + "&";
	}

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
	int totalRecordCount = dao.getTotalRecordCount(param);

	//2.web.xml에 설정된 값 가져오기
	int pageSize = 10;
	int blockPage = 5;
	if (b_id.equals("photo")) {
		pageSize += 2; //사진게시판은 12개씩 리스팅되야한다.
	}

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

	List<BoardDTO> bbs = dao.selectList(param);

	dao.close();

	String photoLink = "";
	if (b_id.equals("photo")) {
		photoLink = "_photo";
	}

	String url = request.getRequestURI() + "?";

	String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
			url + queryStr);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
</head>
<body>
	<script Language="JavaScript" src="../../js/lib.js"></script>
	<link href="../../bbs/skin/bbsBasic/style.css" rel="stylesheet" type="text/css">
	<h3 style="background: url(../image/sub/h3.gif) left 6px no-repeat; line-height: 1.6; font-size: 16px; font-weight: bold; color: #2f2f2f; padding-left: 16px; font-family: '돋움', 'Dotum', Helvetica;">자유게시판</h3>
	<form name=freefrm>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-top: 1px solid #333;">
			<tr style="background: #f7f7f7;">
				<th width="2%"><input type="checkbox" name="select_all" onClick="selectAll(this.form, this)"></th>
				<th width="6%" height="38">번호</th>
				<th width="*">제목</th>
				<th width="12%">작성자</th>
				<th width="12%">작성일</th>
				<th width="8%">조회</th>
				<th width="8%">추천</th>

			</tr>
			<tr>
				<td colspan="10" height="1" bgcolor="#d7d7d7"></td>
			</tr>
			<%
				if (bbs.isEmpty()) {
					//컬렉션에 저장된 데이터가 없는경우
			%>
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
			</tr>
			<%
				} else {
					int i = 0;
					int vNum = 0;
					int countNum = 0;
					for (BoardDTO dto : bbs) {
						vNum = totalRecordCount - 
								(((nowPage-1)*pageSize)+countNum++);
			%>
			<!-- 리스트 반복 -->
			<tr style="">
				<td align="center" width="5%">
					<input type="checkbox" name="select_chkbox" value="<%=vNum%>">
				</td>
				<td align="center" height="38"><%=totalRecordCount - (((nowPage - 1) * pageSize) + i++)%></td>

				<td align="left" style="padding-left: 10px; word-break: break-all;">
					<a href='bbs_contents.jsp?b_id=${param.b_id }&amp;num=<%=dto.getNum() %>&amp;nowPage=${param.nowPage }'><%=dto.getTitle()%></a>
					<!-- 댓글란 -->
				</td>
				<td align="center"><%=dto.getName()%></td>
				<td align="center"><%=dto.getRegidate()%></td>
				<td align="center"><%=dto.getViewcnt()%></td>
				<td align="center">0</td>
			</tr>
			<tr>
				<td colspan="10" height="1" bgcolor="#d7d7d7"></td>
			</tr>
			<!-- 리스트 반복 끝 -->
			<%
				}
				}
			%>
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
										<%=pagingImg%>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- 페이지 번호끝 -->
	</form>
	<!-- 검색 -->
	<div class="AWbbs_f_search">
		<form name="searchfrm">
			<table width="0%" border="0" cellpadding="0" cellspacing="0" align="center">
				<input type="hidden" name="b_id" value="free">
				<input type="hidden" name="nowPage" value="">
				<tr>
					<td>
						<select name="searchColumn" style="height: 28px;">
							<option value="title">제 목</option>
							<option value="content">내 용</option>
							<option value="both">제목 + 내용</option>
							<option value="name">작성자</option>
							<option value="memid">아이디</option>
						</select>
					</td>
					<td>
						<input name="searchWord" type="text" value="" />
					</td>
					<td>
						<button type="submit">
							<img src="../../bbs/skin/bbsBasic/image/btn_search.gif" />
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 검색 끝 -->
	<!-- 버튼 -->
	<div style="margin: 10px 0 0;">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="33%">
					<button type="button" class="h22 t4 small icon gray" onClick="selDelete();">
						<span class="icon_plus"></span>선택삭제
					</button>
				</td>
				<td align="right">
					<a href='bbs_write.jsp?b_id=${param.b_id }' onclick="window.open(this.href,'팝업창','width=800, height=800'); return false;"> <img src='../../bbs/skin/bbsBasic/image/btn_write.gif' border='0'></a>
				</td>
			</tr>
		</table>
	</div>
	<!-- 버튼 끝 -->
</body>
</html>