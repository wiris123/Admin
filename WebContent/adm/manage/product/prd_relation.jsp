<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TITLE</title>
<link href="../wiz_style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form name="frm" action="http://demohome.anywiz.co.kr/adm/manage/product/prd_save.php" onSubmit="return inputCheck(this)" method="post">
<input type="hidden" name="mode" value="reldel">
<input type="hidden" name="prdcode" value="1605270003"> 
<table border="0">
	<tr>
		<td width="50">
    	<table border="0">
    	<tr><td><button type="button" onClick="addReation();" class="h18 t3 color small round black_s">등록</button></td></tr>
    	<tr><td><button type="submit" class="h18 t3 color small round red_s">삭제</button></td></tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>