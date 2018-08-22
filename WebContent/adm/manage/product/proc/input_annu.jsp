<%@page import="controller.InsuDAO"%>
<%@page import="dto.AnnuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일명 : write_proc.jsp

//한글깨짐처리
request.setCharacterEncoding("UTF-8");

//폼값받기
String ann_name = request.getParameter("ann_name");
String instype= request.getParameter("instype");
String instart = request.getParameter("instart");
String paytime= request.getParameter("paytime");
String payment = request.getParameter("payment");
String rprem= request.getParameter("rprem");
String interest = request.getParameter("interest");
String monthann = request.getParameter("monthann");
String submit = request.getParameter("submit");
String attfile= request.getParameter("attfile");


//DTO객체 생성 및 값 설정
AnnuDTO dto = new AnnuDTO();
dto.setAnn_name(ann_name);
dto.setInstype(instype);
dto.setInstart(instart);
dto.setPaytime(paytime);
dto.setPayment(payment);
dto.setRprem(rprem);
dto.setInterest(interest);
dto.setMonthann(monthann);
dto.setSubmit(submit);
dto.setAttfile(attfile);

//커넥션풀로 변경
InsuDAO dao = new InsuDAO();

int affected = dao.annu_insertWrite(dto);
dao.close();
if(affected==1){
	//글쓰기에 성공했을때...
	out.println("상품등록완료");
	response.sendRedirect("../prd_list_annu.jsp");
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