<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>      
<%
	//로그아웃처리	
	session.removeAttribute("USER_ID");	
	session.removeAttribute("USER_NAME");	
	session.invalidate();//세션영역을 비워준다.
	//response.sendRedirect("../main/main.jsp");
	JavascriptUtil.jsAlertLocation("로그아웃되었습니다", 
			"http://naver.com", out);
	
%>