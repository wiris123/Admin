<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="admin_check.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script>
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<script language="JavaScript" src="../../js/default.js"></script>
<script language="JavaScript" src="../../js/lib.js"></script>
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
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
	<div id="Header">
		<h1>
			<a href="../main/main.jsp" onFocus="this.blur();"><img src="../image/header/logo.png" /></a>
		</h1>
		<ul id="gnb">
			<li><a href="../main/chat.jsp" target="_blank" onFocus="this.blur();">관리자홈</a></li>
			<li><a href="../member/logout.jsp" onFocus="this.blur();"
				class="logbtn"><img src="../image/header/logout.gif" /></a></li>
		</ul>
		<div id="navi">
			<li class="design" ><a href="../main/main.jsp"
				onFocus="this.blur();"><span>환경설정</span></a></li>

			<!-- <li><a href="../basic/site_info.jsp" onFocus="this.blur();"><span>기본설정</span></a>
				<ul class="category">
					<li><a href="../basic/site_info.jsp">사이트정보</a></li>
					<li><a href="../basic/admin_list.jsp">관리자설정</a></li>
					<li><a href="../basic/popup_list.jsp">팝업관리</a></li>
					<li><a href="../basic/sms_fill.jsp">SMS관리</a></li>
				</ul>
			</li> -->


			<li><a href="../bbs/bbs_manage.jsp?b_id=list&nowPage=1" onFocus="this.blur();"><span>게시판관리</span></a>
				<ul class="category">
					<li><a href="../bbs/bbs_manage.jsp?b_id=list&nowPage=1">게시물통합관리</a></li>
					<li><a href="../bbs/bbs_manage.jsp?b_id=comment&nowPage=1">코멘트통합관리</a></li>
					<li class="depth"><a href="#" onFocus="this.blur();">게시판관리</a>
						 <ul class="category_2depth">
							<li><a href="bbs_input.jsp?mode=update&amp;code=bbsBasic&amp;page=1">자유게시판</a></li><!-- 추가 -->
							<li><a href="bbs_input.jsp?mode=update&amp;code=photoBasic&amp;page=1">갤러리</a></li>
							<li><a href="bbs_input.jsp?mode=update&amp;code=answerBasic&amp;page=1">응답게시판</a></li>
						</ul>
					</li> 
				</ul></li>

			<li><a href="../member/member_list.jsp" onFocus="this.blur();"><span>회원관리</span></a>
				<ul class="category">
					<li><a href="../member/member_list.jsp">회원목록</a></li>
					<li><a href="../member/out_list.jsp">탈퇴회원</a></li>
					<li><a href="../member/memberQ_list.jsp">상담회원목록</a></li>
				</ul></li>
			<li><a href="../form/form_list.jsp" onFocus="this.blur();"><span>상담관리</span></a>
				<ul class="category">		
					<li><a href="../form/form_list.jsp">통합상담관리</a></li>
					<li class="depth"><a href="#" onFocus="this.blur();">상담목록</a>
						 <ul class="category_2depth">
							<li><a href="../form/form_list_consult.jsp?code=formBasic">상담예약</a></li><!-- 추가 -->
							<li><a href="../form/form_list_email.jsp??flag=mail">이메일상담</a></li>
						</ul>
					</li> 
				</ul>
			</li>
			

			<li><a href="../connect/connect_list.jsp?fromdate=&todate="
				onFocus="this.blur();"><span>접속통계</span></a>
				<ul class="category">
					<li><a href="../connect/connect_list.jsp?fromdate=&todate=">접속자분석</a></li>
				</ul></li>

			<li><a href="#" onFocus="this.blur();"><span>상품관리</span></a>
				<ul class="category">
				<li class="depth"><a href="#" onFocus="this.blur();">상품목록</a>
						 <ul class="category_2depth">
							<li><a href="../product/prd_list_term.jsp">정기보험</a></li>
							<li><a href="../product/prd_list_annu.jsp">연금보험</a></li>
							<li><a href="../product/prd_list_prop.jsp">실손보험</a></li>
						</ul>
					</li>
					<li class="depth"><a href="#" onFocus="this.blur();">상품등록</a>
						 <ul class="category_2depth">
							<li><a href="../product/prd_input_term.jsp">정기보험</a></li>
							<li><a href="../product/prd_annu_input.jsp">연금보험</a></li>
							<li><a href="../product/prd_prop_input.jsp">실손보험</a></li>
						</ul>
					</li>
					<li class="depth"><a href="#" onFocus="this.blur();">가입현황</a>
						 <ul class="category_2depth">
							<li><a href="../product/prd_status_list.jsp?mode=term">정기보험</a></li>
							<li><a href="../product/prd_status_list.jsp?mode=annu">연금보험</a></li>
							<li><a href="../product/prd_status_list.jsp?mode=prop">실손보험</a></li>
						</ul>
					</li>  
				</ul>	
			</li>
		</div>
	</div>
</body>
</html>