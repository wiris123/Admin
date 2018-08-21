<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리</title>
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
			<script Language="Javascript">
			<!--
				function resizeFrame(iframeObj) {

					var innerBody = iframeObj.contentWindow.document.body;
					oldEvent = innerBody.onclick;
					innerBody.onclick = function() {
						resizeFrame(iframeObj, 1);
						oldEvent;
					};

					var innerHeight = innerBody.scrollHeight
							+ (innerBody.offsetHeight - innerBody.clientHeight);
					iframeObj.style.height = innerHeight;

					if (!arguments[1]) /* 특정 이벤트로 인한 호출시 스크롤을 그냥 둔다. */
						this.scrollTo(1, 1);

				}
			//-->
			</script>
			<div id="location">HOME > 게시판관리</div>
			<div id="S_contents">

				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<h3 style="background: url(../image/sub/h3.gif) left 6px no-repeat; line-height: 1.6; font-size: 16px; font-weight: bold; color: #2f2f2f; padding-left: 16px; font-family: '돋움', 'Dotum', Helvetica;">갤러리</h3>
						<td align="center">
							<%@ include file="./photo_list.jsp" %>
					</tr>
				</table>

			</div>
		</div>
</body>
</html>