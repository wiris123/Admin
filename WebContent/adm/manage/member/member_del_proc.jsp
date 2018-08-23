<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.MemberDAO"%>
<%@page import="controller.InsuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	
	String[] sp_name =id.split("-");
	MemberDAO dao = new MemberDAO();
	
	int aff=0;
	for(int i=1; i<sp_name.length; i++)
	{
		
		aff = dao.delete(id);
		
	}
	dao.close();
	
	if(aff==1)
	{
%>
<script>
alert("삭제완료")
location.href="member_list.jsp"
</script>
<% } %>
