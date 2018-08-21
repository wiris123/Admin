<%@page import="member1.OutMemDTO"%>
<%@page import="util.JavascriptUtil"%>
<%@page import="controller.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String reason = request.getParameter("reason");



OutMemDTO dto = new OutMemDTO(id,reason,null);

MemberDAO dao = new MemberDAO();
int af = dao.memberRegist2(dto);
if(af==1){
	
	JavascriptUtil.jsAlertLocation("성공", 
			"../member/out_list.jsp", out);
}
else{
	//out.println("실패");
	JavascriptUtil.jsAlertBack("실패", out);
}


%>