<%@page import="util.JavascriptUtil"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>      
<%
//폼값받기
String id = request.getParameter("id");
String pass = request.getParameter("pass");

/* //함수호출
Map<String, String> memberInfo = dao.memberLogin(id, pass);
 */

if(id.equals("admin")&& pass.equals("1234"))
{
	//세션영역에 저장
	session.setAttribute("USER_ID",id);
	session.setAttribute("USER_PASS", pass);
	response.sendRedirect("../main/main.jsp");
}
else{
	JavascriptUtil.jsAlertBack("로그인 실패욤", out);
}
%>



