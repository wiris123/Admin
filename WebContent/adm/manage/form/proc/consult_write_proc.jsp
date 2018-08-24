<%@page import="dto.CounselDTO"%>
<%@page import="controller.CounselDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//2. DAO 만들기. 3번 DTO객체 만들기 4. DTO에 값을 집어넣기  
// 5. DTO를 변수로 받는 write함수 DAO에 작성하기 6. 작성이 완료되었는지 int로 확인받음.
String idx = request.getParameter("idx");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");
String contents = request.getParameter("contents");
String flag = request.getParameter("flag");

CounselDTO dto = new CounselDTO();
dto.setIdx(idx);
dto.setName(name);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setContents(contents);
dto.setFlag(flag);

CounselDAO dao = new CounselDAO();
//// 1,0은 왜 받는다? 1,0 으로 반환받으니까 받는다
int affected = dao.formWrite(dto);
dao.close();
if(affected==1)
{ 
	response.sendRedirect("../form_list_consult.jsp?flag="+flag);
}
else
{
%>
<script>
	alert("글쓰기 실패");
	history.go(-1);
</script>			
<% } %>
