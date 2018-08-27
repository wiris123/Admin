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

							<div style="background: #f7f7f7; border: 1px solid #ddd; padding: 15px; margin-bottom: 20px;">
								<form name="comment" action="http://demohome.anywiz.co.kr/adm/manage/bbs/bbs.php?code=bbsBasic&amp;page=1" method="post" onSubmit="return commentCheck(this);">
									<div>
										<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_comment_input_info">
											<tr>
												<td class="w30">이름</td>
												<td>
													<input type="text" name="name" value="deleted" class="input w80" />
												</td>
												<td class="w55">비밀번호</td>
												<td>
													<input type="password" name="passwd" onClick="memberCheck();" class="input w80" />
												</td>
												<td>
													<!--<img src='/adm/bbs/norobot_image.php?ss_norobot_key=b68269' border='0' style='border: 1px solid #343d4f;' align='absmiddle'> <input type='text' name='vcode' id='vcode' class='input w100' /><font class='comment left10'>* 왼쪽의 자동등록방지 코드를 입력하세요.</font> -->
												</td>
											</tr>
										</table>
									</div>

									<div style="margin: 5px 0 0;">
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<textarea name="content" onClick="memberCheck();" class="input" style="width: 100%; height: 55px; word-break: break-all; background: #fff; padding: 3px 1px;"></textarea>
												</td>
												<td width="90" align="right">
													<button type="submit">
														<img src="../../bbs/skin/bbsBasic/image/btn_comm_ok.gif" />
													</button>
												</td>
											</tr>
										</table>
									</div>
								</form>
							</div>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right">
										&nbsp;&nbsp;
										<!-- 리스트버튼 -->
										<a href='bbs7cf3.html?ptype=list&amp;code=bbsBasic'> <img src='../../bbs/skin/bbsBasic/image/btn_list.gif' border='0'></a>&nbsp;
										<!-- 수정버튼 -->
										<a href='bbsadbd.html?ptype=input&amp;mode=modify&amp;code=bbsBasic&amp;idx=5279&amp;page=1'> <image src='../../bbs/skin/bbsBasic/image/btn_modify.gif' border='0'></a>&nbsp;
										<!-- 삭제버튼 -->
										<a href='bbsf252.html?ptype=passwd&amp;mode=delete&amp;code=bbsBasic&amp;idx=5279&amp;page=1'> <image src='../../bbs/skin/bbsBasic/image/btn_delete.gif' border='0'></a>&nbsp;
								</tr>
							</table>
							<table width='100%' height='10'>
								<tr>
									<td></td>
								</tr>
							</table>
							<jsp:include page="bbs_list_${param.b_id }.jsp" />
						</td>
					</tr>
				</table>
			</div>
		</div>
</body>
</html>