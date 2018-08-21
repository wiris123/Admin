
<%@page import="util.JavascriptUtil"%>
<%@page import="dto.MemberDTO"%>
<%@page import="controller.MemberDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%	


request.setCharacterEncoding("UTF-8");

Map<String,Object> param = new HashMap<String,Object>();
String id = request.getParameter("id");
String nowPage = request.getParameter("nowPage");
param.put("id", id);

MemberDAO dao = new MemberDAO();
MemberDTO dto = new MemberDTO();


int affected  = dao.delete(param);

if(affected==1){
	
	JavascriptUtil.jsAlertLocation("삭제되었습니다", 
			"write_process2.jsp", out);
	
}
else{
	
	out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다"));
}
%>