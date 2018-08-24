<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.CounselDTO"%>
<%@page import="controller.CounselDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write2.jsp</title>
<link rel="stylesheet" href="../css/jquery-ui.css">
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
</head>
<style>
	.ui-datepicker { width: 242px; font-size:90%;}
	.ui-datepicker-calendar > tbody td:first-child a { 
	COLOR: #f00; 
	}
	.ui-datepicker-calendar > tbody td:last-child a { 
		COLOR: blue; 
	}
</style>

<%
//한글처리
request.setCharacterEncoding("UTF-8");

String flag = request.getParameter("flag")==null ? "f" : request.getParameter("flag");

//현재시간 구하기
long time = System.currentTimeMillis(); 
SimpleDateFormat dayTime = new SimpleDateFormat("yy/MM/dd");
String str = dayTime.format(new Date(time));
System.out.println(str);

long start = System.currentTimeMillis() ; 
long end = System.currentTimeMillis(); 

pageContext.setAttribute("str", str);
%>
<body>
<!-- 헤드 -->
<%@include file="../include/head.jsp"%>
<!-- 레프트 -->
<div id="Container_wrap" class="right_close">
    <!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>
	
	<%@include file="../include/common_form.jsp" %>
	
    <div id="left_area">
		<%@include file="../include/form_left.jsp"%>
	</div><!-- //left_area// -->

	<div id="Container">
   
		<div id="location">HOME > <%= path_str %></div>
		<div id="S_contents">
		<h3><%= path_str %><span>작성된 <%= path_str %>를 합니다.</span></h3>	
			<!-- 검색폼 -->
			<form action="./proc/form_write_proc.jsp" name="mwriteForm" method="get">
				<input type="hidden" name="flag" value="<%=flag %>" />
				<input type="hidden" name="nowPage" value="1" />
				<script Language="JavaScript" src="../../../adm/js/md5.js"></script>
				<link href="../../../adm/bbs/skin/myBasic/style.css" rel="stylesheet" type="text/css">
				<script language="JavaScript">
				<!--
				   function bbsCheck(frm) {
				
				      if (frm.name.value == "") {
				         alert("작성자를 입력하세요.");
				         frm.name.focus();
				         return false;
				      }
				
				      if (frm.title.value == "") {
				         alert("제목을 입력하세요.");
				         frm.title.focus();
				         return false;
				      }
				      try {
				         content.outputBodyHTML();
				      } catch (e) {
				      }
				      if (frm.contents.value == "") {
				         alert("내용을 입력하세요.");
				         return false;
				      }
				      if (frm.vcode != undefined
				            && (hex_md5(frm.vcode.value) != md5_norobot_key)) {
				         alert("자동등록방지코드를 정확히 입력해주세요.");
				         frm.vcode.focus();
				         return false;
				      }
				
				   }
				
				   function searchMem() {
				
				      window
				            .open(
				                  "/adm/bbs/skin/myBasic/mem_search.php",
				                  "searchMem",
				                  "width=427, height=280, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, top=100, left=100");
				
				   }
				   -->
				</script>
				<div style="text-align: right; margin: 0 0 10px;">
					<b>*</b> 표시는 필수입력 사항으로 글 작성시 반드시 기재해야 하는 항목입니다.
				</div>
				<table width="100%" border="0" cellpadding="5" cellspacing="0" class="AWbbs_input_table">
					<input type="hidden" name="" value="">
					<tr>
				    	<th width="10%">작성자 *</th>
				      	<td width="35%">
				         	<input name="name" value="" type="text" class="input w100"/>
				      	</td>
				      	<th width="10%">작성일 *</th>
				      	<td colspan="3">
				        	<input name="regidate" value="${str }" type="text" class="input w100" class="input" readonly />
				   		</td>
					</tr>
				
					<tr>
				   		<th>모바일 *</th>
				   		<td colspan="3">
				      		<input name="mobile1" value="" type="text" class="input w150" /> - <input name="mobile2" value="" type="text" class="input w150" /> - <input name="mobile3" value="" type="text" class="input w150" />
				   		</td>
					</tr>
				
					<tr>
					   	<th>이메일</th>
					   	<td colspan="3">
					    	<input type="text" name="email1" class="input w200" /> @ <input type="text" name="email2" class="input w200" />
					   	</td>
					</tr>
					<tr>
				   		<td colspan="4" align="center" style="padding: 10px 0;">
				  		<div>
				      		<script type="text/javascript" src="../../../adm/webedit/cheditor.js"></script>
				      		<textarea id="content" name="contents"></textarea>
				   		</div>
						</td>
					</tr>
				</table>
				<div align="left">
				<table width="100%"border="0" cellpadding="10" cellspacing="0" class="top5">
					<tr>
				  		<td width="8%"><input type="hidden" name="" value=""/>
				   			<button type="submit" class="h22 t4 small icon gray" onClick="">
							<span class="icon_plus"></span>글전송</button>
								&nbsp;
							<input type="hidden" value="<%=page_flag%>" id="page_flag"/>
							<button type="button" class="h22 t4 small icon gray" onClick="location.href='form_list.jsp?flag=f'">
					    	<span class="icon_plus"></span>목록으로</button>
				    	</td>
				  	</tr>
				</table>
				</div>
			</form>
		</div>
	</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/form/form_list.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:10:48 GMT -->
</html>