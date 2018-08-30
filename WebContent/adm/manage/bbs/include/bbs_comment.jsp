<%@page import="dto.CommDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//커넥션풀로 변경
	BbsDAO dao = new BbsDAO();

	//해당글의 댓글을 찾기 위해서 num 을 변수에 저장
	String num = request.getParameter("num");

	List<CommDTO> bbs = dao.commentList(num);

	dao.close();
%>
<script>
function comdel(form){
	if(confirm("댓글을 지웁니다."))
	{
		form.submit;
		return true;	
	}
	else{
		return false;
	}
	
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom: 1px solid #ddd;">
	<!-- 덧글반복 -->
	<%
		for (CommDTO dto : bbs) {
	%>
	<tbody>
		<tr>
			<td colspan="4" height="1" style="background: #ddd;"></td>
		</tr>
		<tr>
			<td width="12%" height="45" class="AWbbs_comment_id">
				<p><%=dto.getCom_name()%></p>
			</td>

			<td align="left" style="padding: 5px 10px; line-height: 1.4;"><%=dto.getCom_content()%></td>

			<td align="center" width="15%" style="font-weight: normal; font-size: 8pt;"><%=dto.getCom_regidate()%></td>
			<td align="right" width="7%">
				<form action="./proc/bbs_comdel_proc.jsp" method="post" onsubmit='return comdel(this)'>
					<input type="hidden" name="com_idx" value="<%=dto.getCom_idx()%>"/>
					<input type="hidden" name="b_id" value="${param.b_id }" />
					<input type="hidden" name="num" value="${param.num }" />
					<input type="hidden" name="nowPage" valye="${param.nowPage }" />
					<input type="image" src="/Admin/adm/bbs/skin/bbsBasic/image/ic_del.gif" />
				</form>
			</td>

		</tr>
	</tbody>
	<%
		}
	%>
	<!-- 덧글 반복 끝 -->
</table>

<br />

<!-- 덧글달기 시작 -->
<div style="background: #f7f7f7; border: 1px solid #ddd; padding: 15px; margin-bottom: 20px;">
	<form name="comment" action="./proc/bbs_comment_proc.jsp" method="post" onSubmit="return commentCheck(this);">
		<div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_comment_input_info">
				<tr>
					<input type="hidden" name="b_id" value="${param.b_id }" />
					<input type="hidden" name="num" value="${param.num }" />
					<input type="hidden" name="nowPage" valye="${param.nowPage }" />
					<td class="w40">이름</td>
					<td>
						<input type="text" name="com_name" value="" class="input w100" />
					</td>
					<td class="w55">작성일</td>
					<td>
						<input type="text" name="com_regidate" class="input w100" readonly />
					</td>
					<td>
						<!--<img src='/adm/bbs/norobot_image.php?ss_norobot_key=b68269' border='0' style='border: 1px solid #343d4f;' align='absmiddle'> <input type='text' name='vcode' id='vcode' class='input w100' /><font class='comment left10'>* 왼쪽의 자동등록방지 코드를 입력하세요.</font> -->
					</td>
				</tr>
			</table>
		</div>

		<div style="margin: 5px 0 0;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<textarea name="com_content" onClick="memberCheck();" class="input" style="width: 100%; height: 55px; word-break: break-all; background: #fff; padding: 3px 1px;"></textarea>
					</td>
					<td width="90" align="right">
						<button type="submit">
							<img src="../../bbs/skin/bbsBasic/image/btn_comm_ok.gif" />
						</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<!-- 덧글창 끝 -->