<%@page import="dto.MyStatusDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.InsuDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

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
String mode = request.getParameter("mode");
String death_ins = request.getParameter("death_ins");

//커넥션풀로 dao객체 생성
InsuDAO dao = new InsuDAO();
int affected=0;

//DTO객체 생성 및 값 설정
MyStatusDTO dto = new MyStatusDTO();
dto.setId(id);
dto.setInsname(insname);
dto.setInsnum(insnum);
dto.setRemainpay(remainpay);
dto.setPaidprem(paidprem);
dto.setPrem(prem);
dto.setContstat(contstat);
dto.setDeath_ins(death_ins);

affected = dao.insertStatusWrite(dto,mode);

dao.close();
if(affected==1){
	//글쓰기에 성공했을때...
	out.println("상품등록완료");
	response.sendRedirect("../prd_status_list.jsp?mode="+mode+"");
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
