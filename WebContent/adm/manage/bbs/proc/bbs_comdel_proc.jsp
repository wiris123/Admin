<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//돌아가기 위한 파라미터 저장
	String b_id = request.getParameter("b_id");
	int nowPage = (request.getParameter("nowPage") == "") ? 1: Integer.parseInt(request.getParameter("nowPage"));
	String num = request.getParameter("num");
	
	//삭제할 com_idx 가져옴
	String com_idx = request.getParameter("com_idx");
	BbsDAO dao = new BbsDAO();
	int affected=0;

	affected = dao.comdel(com_idx); 
	dao.close();
	
	if(affected==1)
	{
	%>
	<script>
	alert("댓글삭제 완료");
	location.href="../bbs_contents.jsp?b_id=<%=b_id%>&num=<%=num%>&nowPage=<%=nowPage%>";
	</script>
	<%}else{ %>
	<script>
	alert("댓글삭제중 에러발생");
	history.go(-1);
	</script>
	<%}%>