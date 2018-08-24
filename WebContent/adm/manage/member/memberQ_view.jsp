<%@page import="dto.CounselMemDTO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");

String idx = request.getParameter("idx");

MemberDAO dao = new MemberDAO();
 
CounselMemDTO dto = dao.selectViewQ(idx);

pageContext.setAttribute("dto", dto);
dao.close();


%>
<!DOCTYPE html>

<html lang="ko">


<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/member/member_input.php?mode=insert by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:13:55 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>홈페이지 관리자</title>
<link rel="stylesheet" href="../../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script>
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<link href="../wiz_style.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="../../js/default.js"></script>
<script language="JavaScript" src="../../js/lib.js"></script>
<style>
	.ui-datepicker { width: 242px; font-size:90%;}
	.ui-datepicker-calendar > tbody td:first-child a { 
	COLOR: #f00; 
	}
	.ui-datepicker-calendar > tbody td:last-child a { 
		COLOR: blue; 
	}
</style>

</head>
<body class="home_body">
<%@include file="../include/head.jsp" %>





<div id="S_contents">
	
	<h3>회원관리<span>회원을 합니다.</span></h3>

		
	
	<form name="frm" >
	<input type="hidden" name="tmp">
	<input type="hidden" name="mode" value="update">
	<input type="hidden" name="idx" value="109">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
			<tr>
				<th width="15%">번호</th>
					<td width="35%">
						${dto.idx }
					</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td colspan="3">
					${dto.id }
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="3" colspan="3">
					${dto.mobile }
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td colspan="3" colspan="3">
					${dto.regidate }
				</td>
			</tr>
			<tr>
				<th height="25">내용</th>
				<td colspan="3">
					${dto.contents }
				</td>
			</tr>
			</table>
			
		</td>
	</tr>
	</table>

	<div class="center top10">
		
		<button style="border:0" type="button" class="b h28 t5 color gray_big" onClick="document.location='memberQ_list.jsp';">목록</button>
	</div>
	</form>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/member/member_input.php?mode=update&idx=109&page=1&sdate=&edate=&slevel=&searchopt=&searchkey= by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:13:56 GMT -->
</html>
