<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path_str="";
String page_flag = "";
switch(flag)
{
case "f":
	path_str = "통합상담관리";
	page_flag = "list_";
	break;
case "c":
	path_str = "상담예약";
	page_flag="consult_";
	break;
case "e":
	path_str = "이메일상담";
	page_flag ="email_";
	break;
}
%>