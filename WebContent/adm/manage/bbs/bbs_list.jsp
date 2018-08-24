<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script src="../js/sidemenu.js"></script>
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
				
				<jsp:include page="bbs_list_${param.b_id }.jsp" />
						<!-- 버튼 -->
						<div style="margin: 10px 0 0;">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="33%">
         								<button type="button" class="h22 t4 small icon gray" onClick="selDelete();"><span class="icon_plus"></span>선택삭제</button>
         							</td>
									<td align="right">
										<a href='bbs_write.jsp?b_id=${param.b_id }' onclick="window.open(this.href,'팝업창','width=800, height=800'); return false;">
									<img src='../../bbs/skin/bbsBasic/image/btn_write.gif' border='0'></a></td>
								</tr>
							</table>
						</div>
						<!-- 버튼 끝 -->
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- //Container// -->
	</div>
	<!-- //Container_wrap// -->

	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>