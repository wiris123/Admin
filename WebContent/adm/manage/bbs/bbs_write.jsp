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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="JavaScript">
<%if (request.getParameter("b_id") == null) {%>
alert("잘못된 경로로 접속하셧습니다");
window.close();
history.go(-1);
<%}%>
var b_id = "<%=request.getParameter("b_id")%>";
$(function(){
<<<<<<< HEAD
	$("#bbsFrm").submit(function() {
		if($("#attfile").get(0).files.length==0){
			$("#bbsFrm").attr("action","./proc/bbs_write_proc.jsp?flag=<%=request.getParameter("flag")%>&filecheck=1")
		}
		else{
			if(b_id=="photo"){

					var ext = $('#attfile').val().split('.').pop().toLowerCase();

					if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
						 return false;
					}	
=======
 	$("#bbsFrm").submit(function() {
 		if($("#attfile").get(0).files.length==0){
 			$("#bbsFrm").attr("action","./proc/bbs_write_proc.jsp?flag=<%=request.getParameter("b_id")%>&filecheck=1")
 		}
 		else{
 			if(b_id=="photo"){
 
 					var ext = $('#attfile').val().split('.').pop().toLowerCase();
 
 					if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
 
 						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
 
 						 return false;
 
 					}	
 			}
 	    	$("#bbsFrm").attr("enctype","multipart/form-data")
 	    	$("#bbsFrm").attr("action","./proc/bbs_write_proc.jsp?flag=<%=request.getParameter("b_id")%>&filecheck=0")
>>>>>>> branch 'underwearRun' of https://github.com/wiris123/Admin
			}
						});
	});
</script>

</head>
<body>
	<h3 style="background: url(../image/sub/h3.gif) left 6px no-repeat; line-height: 1.6; font-size: 16px; font-weight: bold; color: #2f2f2f; padding-left: 16px; font-family: '돋움', 'Dotum', Helvetica;">1:1상담</h3>
	<form name="bbsFrm" id="bbsFrm" action="./proc/bbs_write_proc.jsp" method="post" onSubmit="return bbsCheck(this)">
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

							if (frm.title.value == "") {
								alert("제목을 입력하세요.");
								frm.title.focus();
								return false;
							}
							try {
								content.outputBodyHTML();
							} catch (e) {
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
									<script type="text/javascript" src="../common/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
									<textarea rows="10" cols="30" id="ir1" name="contents" style="width: 766px; height: 412px;"></textarea>
									<script type="text/javascript">
										var oEditors = [];
										$(function() {
											nhn.husky.EZCreator
													.createInIFrame({
														oAppRef : oEditors,
														elPlaceHolder : "ir1",
														//SmartEditor2Skin.html 파일이 존재하는 경로
														sSkinURI : "../common/se2/SmartEditor2Skin.html",
														htParams : {
															// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
															bUseToolbar : true,
															// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
															bUseVerticalResizer : false,
															// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
															bUseModeChanger : true,
															fOnBeforeUnload : function() {

															}
														},
														fCreator : "createSEditor2"
													});
													//전송버튼 클릭이벤트
											        $("#savebutton").click(function() {
											            //id가 smarteditor인 textarea에 에디터에서 대입
											            oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
											 
											            // 이부분에 에디터 validation 검증
											            //폼 submit
											            $("#bbsFrm").submit();
											        })
										});
									</script>

								</div>
							</td>
						</tr>
						<tr>
							<th>첨부파일1</th>
							<td colspan="3">
								<input type="file" id="attfile" name="attfile" class="input w200" />
							</td>
						</tr>
					</table>
					<div style="margin: 10px 0 0;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right">
									<input type='image' id='savebutton' src='../../../adm/bbs/skin/myBasic/image/btn_confirm.gif' border='0'>&nbsp;<img src='../../../adm/bbs/skin/myBasic/image/btn_cancel.gif' border='0' onClick='window.close();' style='cursor: pointer'>
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