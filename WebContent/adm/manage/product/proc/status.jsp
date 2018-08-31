<%@page import="dto.MyTermDTO"%>
<%@page import="controller.InsuDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일명 : write_proc.jsp

//한글깨짐처리
request.setCharacterEncoding("UTF-8");

//폼값받기
String id = request.getParameter("id");
String insname = request.getParameter("insname");
String insnum = request.getParameter("insnum");
String remainpay = request.getParameter("remainpay");
String paidprem = request.getParameter("paidprem");
String prem = request.getParameter("prem");
String contstat = request.getParameter("contstat");


//DTO객체 생성 및 값 설정
MyTermDTO dto = new MyTermDTO();
dto.setId(id);
dto.setInsname(insname);
dto.setInsnum(insnum);
dto.setRemainpay(remainpay);
dto.setPaidprem(paidprem);
dto.setPrem(prem);
dto.setContstat(contstat);


//커넥션풀로 변경
InsuDAO dao = new InsuDAO();

int affected = dao.insertStatusWrite(dto);
dao.close();
if(affected==1){
	//글쓰기에 성공했을때...
	out.println("상품등록완료");
	response.sendRedirect("../prd_status_term.jsp");
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
