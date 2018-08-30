<%@page import="controller.InsuDAO"%>
<%@page import="dto.PropDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일명 : write_proc.jsp

//한글깨짐처리
request.setCharacterEncoding("UTF-8");

//폼값받기
String prop_name = request.getParameter("prop_name");
String instype = request.getParameter("instype");
String monthpay= request.getParameter("monthpay");
String hosp = request.getParameter("hosp");
String gohosp = request.getParameter("gohosp");
String sanghosp = request.getParameter("sanghosp");
String sgohosp = request.getParameter("sgohosp");
String chbedosu = request.getParameter("chbedosu");
String chbeinje = request.getParameter("chbeinje");
String chbemri = request.getParameter("chbemri");
String attfile = request.getParameter("attfile");


//DTO객체 생성 및 값 설정
PropDTO dto = new PropDTO();
dto.setProp_name(prop_name);
dto.setInstype(instype);
dto.setMonthpay(monthpay);
dto.setHosp(hosp);
dto.setGohosp(gohosp);
dto.setSanghosp(sanghosp);
dto.setSgohosp(sgohosp);
dto.setChbedosu(chbedosu);
dto.setChbeinje(chbeinje);
dto.setChbemri(chbemri);
dto.setAttfile(attfile);

//커넥션풀로 변경
InsuDAO dao = new InsuDAO();

int affected = dao.prop_insertWrite(dto);
dao.close();
if(affected==1){
	//글쓰기에 성공했을때...
	out.println("상품등록완료");
	response.sendRedirect("../prd_list_prop.jsp");
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