<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>코멘트관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="../wiz_style.css" rel="stylesheet" type="text/css">

<div id="S_contents">

<form action="http://demohome.anywiz.co.kr/adm/manage/bbs/save.php" method="post">
<input type="hidden" name="mode" value="commentupdate">
<input type="hidden" name="cidx" value="">

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
	<tr>
		<th>이름</th>
		<td><input class="input" type="text" name="name" value=""></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input class="input" type="password" name="passwd" value=""></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
<textarea class="" name="content" cols="30" rows="8" style="width:96%">
</textarea>
		</td>
	</tr>
</table>
<div class="top10 center">
	<button style="border:0" type="button" class="b h28 t5 color blue_big" onclick="this.form.submit()">수정</button>&nbsp;
	<button style="border:0" type="button" class="b h28 t5 color gray_big" onclick="window.close();">닫기</button>
</div>
</form>

</div>
</body>
</html>