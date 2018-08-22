<%@page import="controller.InsuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String ann_name = request.getParameter("ann_name");
	
	String[] sp_name = ann_name.split("-");
	
	InsuDAO dao = new InsuDAO();
	int aff=0;
	for(int i=1; i<sp_name.length; i++)
	{
		aff = dao.deleteAnnu(sp_name[i]);
	}
	dao.close();
	
	if(aff==1)
	{
%>
<script>
alert("삭제완료")
location.href="../prd_list_annu.jsp"
</script>
<% } %>
