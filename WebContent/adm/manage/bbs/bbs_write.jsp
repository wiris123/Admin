<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
	Date date = new Date();
	String regidate = dateFormat.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script language="JavaScript">
<%if(request.getParameter("b_id")==null){
%>
alert("잘못된 경로로 접속하셧습니다");
window.close();
history.go(-1);
<%
}
%>
</script>
</head>
<body>
	<h3 style="background: url(../image/sub/h3.gif) left 6px no-repeat; line-height: 1.6; font-size: 16px; font-weight: bold; color: #2f2f2f; padding-left: 16px; font-family: '돋움', 'Dotum', Helvetica;">1:1상담</h3>
	<form name="bbsFrm" action="./proc/bbs_write_proc.jsp" method="post" onSubmit="return bbsCheck(this)">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top15">
			<tr>
				<td style="padding: 0px 10px 10px 10px">
					<script Language="JavaScript" src="../../../adm/js/md5.js"></script>
					<link href="../../../adm/bbs/skin/myBasic/style.css" rel="stylesheet" type="text/css">
					<script language="JavaScript">
					<!--
						function bbsCheck(frm) {

							if (frm.name.value == "") {
								alert("작성자를 입력하세요.");
								frm.name.focus();
								return false;
							}
							if (frm.passwd != null && frm.passwd.value == "") {
								alert("비밀번호를 입력하세요.");
								frm.passwd.focus();
								return false;
							}
							if (frm.subject.value == "") {
								alert("제목을 입력하세요.");
								frm.subject.focus();
								return false;
							}
							try {
								content.outputBodyHTML();
							} catch (e) {
							}
							if (frm.content.value == "") {
								alert("내용을 입력하세요.");
								return false;
							}
							if (frm.vcode != undefined
									&& (hex_md5(frm.vcode.value) != md5_norobot_key)) {
								alert("자동등록방지코드를 정확히 입력해주세요.");
								frm.vcode.focus();
								return false;
							}

						}

						function searchMem() {

							window
									.open(
											"/adm/bbs/skin/myBasic/mem_search.php",
											"searchMem",
											"width=427, height=280, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, top=100, left=100");

						}
						-->
					</script>
					<div style="text-align: right; margin: 0 0 10px;">
						<b>*</b> 표시는 필수입력 사항으로 글 작성시 반드시 기재해야 하는 항목입니다.
					</div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="AWbbs_input_table">
						<input type="hidden" name="b_id" value="${param.b_id }">
						<tr>
							<th width="15%">작성자 *</th>
							<td width="35%">
								<input name="name" value="" type="text" class="input w150" />
							</td>
							<th>작성일</th>
							<td colspan="3">
								<input name="regidate" value="<%=regidate%>" type="text" class="input w150" readonly />
							</td>
						</tr>

						<tr>
							<th>제목 *</th>
							<td colspan="3">
								<input name="title" value="" type="text" size="70" class="input" />
							</td>
						</tr>

						<tr>
							<td colspan="4" align="center" style="padding: 10px 0;">
								<div>
									<script type="text/javascript" src="../../../adm/webedit/cheditor.js"></script>
									<textarea id="content" name="contents"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th>첨부파일1</th>
							<td colspan="3">
								<input type="file" name="upfile1" class="input w200" />
							</td>
						</tr>
					</table>
					<div style="margin: 10px 0 0;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right">
									<input type='image' src='../../../adm/bbs/skin/myBasic/image/btn_confirm.gif' border='0'>&nbsp;<img src='../../../adm/bbs/skin/myBasic/image/btn_cancel.gif' border='0' onClick='window.close();' style='cursor: pointer'>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>