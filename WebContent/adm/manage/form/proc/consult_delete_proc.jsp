<%@page import="controller.CounselDAO"%>
<%@page import="controller.InsuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("prop_name");
	
	String[] sp_name = idx.split("-");
	
	CounselDAO dao = new CounselDAO();
	int aff=0; 
	for(int i=0; i<sp_name.length; i++)
	{
		aff = dao.deleteTerm(sp_name[i]); 
	}
	dao.close();
	
	if(aff==1)
	{
%>
	<script>
	alert("삭제완료")
	location.href="../form_list_consult.jsp?flag=c"
	</script>
<% } %>