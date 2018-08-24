<%@page import="util.JavascriptUtil"%>
<%@page import="dto.OutMemDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.MemberDAO"%>
<%@page import="controller.InsuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String reason = request.getParameter("reason");

	String[] sp_name =id.split("-");
	MemberDAO dao = new MemberDAO();
	
	int aff=0;
	int aff1 =0;
	for(int i=1; i<sp_name.length; i++)
	{

		aff1 = dao.memberRegist2(sp_name[i],reason);
		aff = dao.delete(sp_name[i]);

		
	}
	dao.close();
	
	if(aff1==1 && aff==1)
	{	
		JavascriptUtil.jsAlertLocation("삭제되었습니다", 
				"member_list.jsp", out);	
	}
	else{
		out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다"));
		
	}
	
%>	