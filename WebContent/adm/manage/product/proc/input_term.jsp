<%@page import="controller.InsuDAO"%>
<%@page import="dto.TermDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일명 : write_proc.jsp

//한글깨짐처리
request.setCharacterEncoding("UTF-8");

//폼값받기
String term_name = request.getParameter("term_name");
String instype= request.getParameter("instype");
String paytime= request.getParameter("paytime");
String instime= request.getParameter("instime");
String rprem= request.getParameter("rprem");
String deathben= request.getParameter("deathben");
String monthpay= request.getParameter("monthpay");
String attfile= request.getParameter("attfile");


//DTO객체 생성 및 값 설정
TermDTO dto = new TermDTO();
dto.setTerm_name(term_name);
dto.setInstype(instype);
dto.setInstime(instime);
dto.setPaytime(paytime);
dto.setRprem(rprem);
dto.setDeathben(deathben);
dto.setMonthpay(monthpay);
dto.setAttfile(attfile);

//커넥션풀로 변경
InsuDAO dao = new InsuDAO();

int affected = dao.insertWrite(dto);
dao.close();
if(affected==1){
	//글쓰기에 성공했을때...
	out.println("상품등록완료");
	response.sendRedirect("../prd_list_term.jsp");
}
else{
	//글쓰기에 실패했을때...	
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%	
}
%>
