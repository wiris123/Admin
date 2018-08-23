<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path_str="";
switch(flag){
case "f":
	path_str = "통합상담관리";
	break;
case "c":
	path_str = "상담예약";
	break;
case "e":
	path_str = "이메일상담";
	break;
}
%>