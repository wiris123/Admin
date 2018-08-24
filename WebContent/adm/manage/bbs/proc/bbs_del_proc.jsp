<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String b_id = request.getParameter("b_id");
	String term_name = request.getParameter("prop_name");
	String[] sp_name = term_name.split("-");
	
	BbsDAO dao = new BbsDAO();
	int aff=0;
	/* for(int i=0; i<sp_name.length; i++)
	{
		aff = dao.delete(sp_name[i]);
	} */
	aff = dao.delete2(sp_name);
	dao.close();
	
	if(aff!=0)
	{
%>
<script>
alert("삭제완료")
location.href="../bbs_list.jsp?b_id=<%=b_id%>"
</script>
<% } 
	else
{%>
<script>
alert("삭제실패")
history.go(-1)
</script>

<% } %>

