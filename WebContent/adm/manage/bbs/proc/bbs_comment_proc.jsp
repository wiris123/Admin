<%@page import="dto.CommDTO"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

CommDTO dto = new CommDTO();
//돌아가기 위해서 변수에 파라미터값 저장
String b_id = request.getParameter("b_id");
int nowPage = (request.getParameter("nowPage") == "") ? 1: Integer.parseInt(request.getParameter("nowPage"));
String num = request.getParameter("num");
String content = request.getParameter("com_content");
content = content.replace("\r\n", "<br>");
//DB에 입력할 데이터를 dto 에 저장
dto.setCom_name(request.getParameter("com_name"));
dto.setCom_content(content);
dto.setBoard_idx(num);


BbsDAO dao = new BbsDAO();

int affected = dao.writeComment(dto);
dao.close();

if(affected==1)
{
%>
<script>
alert("댓글쓰기 완료");
location.href="../bbs_contents.jsp?b_id=<%=b_id%>&num=<%=num%>&nowPage=<%=nowPage%>";
</script>
<%}else{ %>
<script>
alert("댓글쓰기중 에러발생");
history.go(-1);
</script>
<%}%>
