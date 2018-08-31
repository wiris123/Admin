<%@page import="dto.BoardDTO"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	BbsDAO dao = new BbsDAO();
	BoardDTO dto = new BoardDTO();
	String num = request.getParameter("num").toString();
	dto = dao.contents(num);
	//System.out.println("들어온이름은" + dto.getName());
	dao.close();
	System.out.println("파일명" + dto.getAttfile());
	pageContext.setAttribute("dto", dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글읽기</title>
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

		<script Language="JavaScript" src="./select.js"></script>
		<%@include file="../include/bbs_left.jsp"%>
		<div id="Container">

			<div id="location">HOME > 게시판관리</div>
			<div id="S_contents">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top15">
					<tr>
						<td style="padding: 0px 10px 10px 10px">
							<link href="../../bbs/skin/bbsBasic/style.css" rel="stylesheet" type="text/css">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_view_table border">
								<tr>
									<th colspan="2">${dto.title }</th>
								</tr>
								<tr>
									<td height="40">
										작성자 : ${dto.name }(이메일) &nbsp;
										작성일 : ${dto.regidate } &nbsp;
										조회수 : ${dto.viewcnt }</td>
									<td align="right">추천:0</td>
								</tr>

								<tr>
									<td colspan="2" height="40">
										파일첨부 :
										<c:if test="${not empty dto.attfile }">
											${dto.attfile }&nbsp;<a href="./proc/bbs_down_proc.jsp?filename=${dto.attfileR }&num=${dto.num }&rfilename=${dto.attfile }">[다운로드]
											</a>
										</c:if>
										<c:if test="${empty dto.attfile }">
											첨부파일이 없습니다.
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="padding: 20px 0;">${dto.contents }</td>
								</tr>

							</table>
							<div style="margin: 0 0 10px;"></div>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="Paging_Num"></td>
								</tr>
							</table>
<%if(request.getParameter("b_id").toString().equals("response")){ %>
							<!-- 댓글리스트 -->
							<jsp:include page="./include/bbs_comment.jsp" />
							<!-- 댓글리스트 끝 -->
<%} %>							
							
							<script Language="JavaScript">
							//단일삭제
							function aDelete() {
								if (confirm("선택한 상품을 정말 삭제하시겠습니까?")) {
									document.location = "./proc/bbs_del_proc.jsp?prop_name=${param.num }&b_id=${param.b_id}";
								}
								else{
									return false;
								}
							}
							</script>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										&nbsp;&nbsp;
										<!-- 리스트버튼 -->
										<a href='bbs_list.jsp?b_id=${param.b_id }&amp;nowPage=${param.nowPage}'> <img src='../../bbs/skin/bbsBasic/image/btn_list.gif' border='0'></a>&nbsp;
										<!-- 수정버튼 -->
										<a href='./bbs_modify.jsp?b_id=${param.b_id }&nowPage=${param.nowPage }&num=${param.num}' onclick="window.open(this.href,'팝업창','width=1400, height=800'); return false;"> <image src='../../bbs/skin/bbsBasic/image/btn_modify.gif' border='0'></a>&nbsp;
										<!-- 삭제버튼 -->		
										<a href='#' onclick="aDelete();"> <image src='../../bbs/skin/bbsBasic/image/btn_delete.gif' border='0'></a>&nbsp;
								</tr>
							</table>
							<table width='100%' height='10'>
								<tr>
									<td></td>
								</tr>
							</table>
							<a name="list_top"></a>
							<jsp:include page="./include/bbs_list_${param.b_id }.jsp" />
						</td>
					</tr>
				</table>
			</div>
		</div>
</body>
</html>