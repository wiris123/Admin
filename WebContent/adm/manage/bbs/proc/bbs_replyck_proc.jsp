<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String url = request.getParameter("url");
	String num = request.getParameter("num");
	String isChecked = request.getParameter("isChecked");
	System.out.println(isChecked);
	int c = Integer.parseInt(isChecked);
	
	BbsDAO dao = new BbsDAO();
	int affected=0;

	affected = dao.replyck(num, c);
	dao.close();
	
	if(affected!=0)
	{
%>
<script>
alert("변경 완료")
location.href="<%=url%>"
</script>
<% } 
	else
{%>
<script>
alert("변경중 오류가 발생했습니다.")
history.go(-1)
</script>

<% } %>

    