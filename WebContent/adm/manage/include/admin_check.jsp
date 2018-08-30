<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("USER_ID")!="admin")
	{
%>		
	<script>
	alert("관리자만 이용가능합니다.")
	history.go(-1);
	</script>
<% 	}%>
