<%@page import="dto.MemberDTO"%>
<%@page import="util.JavascriptUtil"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email1")+"@"+request.getParameter("email2") ;
String mobile = request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
String birth = request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3");

MemberDTO dto = new MemberDTO(id,pass,name,email,mobile,birth);

MemberDAO dao = new MemberDAO();

//데이터를 회원목록에 insert하는 함수
int af = dao.memberRegist(dto);
if(af==1){
	
	JavascriptUtil.jsAlertLocation("입력되었습니다", 
			"../member/member_list.jsp", out);
}
else{
	//out.println("실패");
	JavascriptUtil.jsAlertBack("에러 발생", out);
}


%>