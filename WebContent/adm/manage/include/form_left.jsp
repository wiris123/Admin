<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_left.jsp</title>
</head>
<body>
<div>

<h2><img src="../image/header/icon3.png" alt="">상담관리</h2>
<ul id="Lnb">
	<li class="on"><a href="form_list.jsp?flag=f" onFocus="this.blur();">통합상담관리</a></li>
	<li class="on"><a href="" onFocus="this.blur();">상담목록</a>
		<ul>
			<li><a href="form_list_consult.jsp?flag=c">상담예약</a></li>
			<li><a href="form_list_email.jsp?flag=mail">이메일상담</a></li>
		</ul>
	</li>
</ul>

</div>
</html>