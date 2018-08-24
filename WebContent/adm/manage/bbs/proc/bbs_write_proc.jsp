<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.BoardDTO"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String b_id = request.getParameter("b_id");
	String id = "짐배";
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String regidate = request.getParameter("regidate");
	SimpleDateFormat dt = new SimpleDateFormat("yy/mm/dd");
	Date date = dt.parse(regidate);
	
	BoardDTO dto = new BoardDTO();
	dto.setB_id(b_id);
	dto.setId(id);
	dto.setName(name);
	dto.setTitle(title);
	dto.setContents(contents);
	dto.setRegidate(date);

	BbsDAO dao = new BbsDAO();

	int affected = dao.write(dto);
	
	dao.close();
	System.out.println(affected);
%>
<script language="JavaScript">
	
<%if (affected == 1) {%>
	alert("글쓰기 완료");
	opener.parent.location.reload();
	window.close();
<%} else {%>
	alert("글쓰기중 문제가 발생하였습니다.");
	opener.parent.location.reload();
	window.close();
<%}%>
</script>