<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈페이지 관리자</title>
</head>
<body class="home_body">
	<%@include file="../include/head.jsp"%>

	<div id="Container_wrap" class="right_close">

		<div class="nav_handle_left">
			<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
		</div>

		<%@include file="../include/bbs_left.jsp"%>
		<div id="Container">
				<jsp:include page="./include/bbs_manage_${param.b_id }.jsp" />
			
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

	<div id="Footer">Copyright ⓒ 2016 Insurance & Saving Management  All rights reserved.</div>
</body>
</html>