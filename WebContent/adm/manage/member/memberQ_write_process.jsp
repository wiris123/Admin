<%@page import="dto.CounselMemDTO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="util.JavascriptUtil"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

String idx = request.getParameter("idx");
String name = request.getParameter("name");
String id = request.getParameter("id");
String mobile = request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
String regidate = request.getParameter("regidate");
String contents = request.getParameter("contents");

CounselMemDTO dto = new CounselMemDTO();
dto.setIdx(idx);
dto.setName(name);
dto.setId(id);
dto.setMobile(mobile);
dto.setContents(contents);


MemberDAO dao = new MemberDAO();

/*상담회원을 INSERT하는 함수  */
int af = dao.memberQRegist(dto);
if(af==1){
	
	JavascriptUtil.jsAlertLocation("입력되었습니다", 
			"../member/memberQ_list.jsp", out);
}
else{
	//out.println("실패");
	JavascriptUtil.jsAlertBack("에러 발생", out);
}


%>