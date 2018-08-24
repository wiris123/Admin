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

String flag =  request.getParameter("flag")==null ? "e" : request.getParameter("flag");

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
<form action="./proc/email_write_proc.jsp" name="mwriteForm" method="get">
<input type="hidden" name="flag" value="<%=flag %>" />
<input type="hidden" name="nowPage" value="1" />
	<table class="table table-bordered">
	<colgroup>
		<col width="50%" height="30%"/>
		<col width="*%" height="30%"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">작성자</th>
			<td>
				<input type="text" class="form-control" 
					style="width:100px;" value="" name="name"
					 />
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">모바일</th>
			<td>
				<input type="text" class="form-control" name="mobile" 
					style="width:400px;" value="" 
					 />
			</td>
		</tr>	
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">작성일</th>
			<td>
				<input type="text" class="form-control" name="regidate"
				/>
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">이메일</th>
			<td>
				<input type="text" name="email1"/>@ <input type="text" name="email2"/>
			
			</td>
		</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td>
				<input type="text" name="contents"/>
			</td>
		</tr>
	</tbody>
	</table>
	<table width="100%"border="0" cellpadding="0" cellspacing="0" class="top5">
	  <tr>
	    <td width="20%"><input type="hidden" name="" value=""/>
	    <button type="submit" class="h22 t4 small icon gray" onClick=""><span class="icon_plus"></span>글전송</button>
	    </td>
	    <td width="20%"><input type="hidden" value="<%=page_flag%>" id="page_flag"/>
	    <button type="button" class="h22 t4 small icon gray" onClick="location.href='form_list_email.jsp?flag=e'"><span class="icon_plus"></span>목록으로</button>
	    </td>
	  </tr>
	</table>
</form>


</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/form/form_list.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:10:48 GMT -->
</html>