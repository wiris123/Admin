<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="../../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<!-- <script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script> -->
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<script language="JavaScript" src="../../js/default.js"></script>
<script language="JavaScript" src="../../js/lib.js"></script>
<style>
	.ui-datepicker { width: 242px; font-size:90%;}
	.ui-datepicker-calendar > tbody td:first-child a { 
	COLOR: #f00; 
	}
	.ui-datepicker-calendar > tbody td:last-child a { 
		COLOR: blue; 
	}
</style>
</head>

<body class="home_left">
	<div id="Container_wrap" class="right_close">
    <!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>

    <div id="left_area">
	

<h2><img src="../image/header/icon3.png" alt=""> 상품관리</h2>
<!-- <ul id="Lnb">
    <li class="on"><a href="prd_list.jsp" onFocus="this.blur();">상품관리</a>
    <li class="on"><a href="prd_list.jsp" onFocus="this.blur();">상품목록</a>
    <li class="on"><a href="prd_list.jsp" onFocus="this.blur();">상품등록</a>
        <ul>
			<li class="">
				<a href="prd_list.jsp">상품목록</a>
			</li>

			<li>
				<a href="prd_input.jsp">상품등록</a>
			</li>

        </ul>
    </li>

</ul> -->
<ul id="Lnb">
	<li class="on"><a href="form_list.html" onFocus="this.blur();">상품목록</a>
		<ul>
					
			<li><a href="prd_list.jsp">정기보험</a></li>
			<li><a href="prd_list_annu.jsp">연금보험</a></li>
			<li><a href="">실손보험</a></li>
		</ul>
	</li>
	<li class="on"><a href="form_list.html" onFocus="this.blur();">상담등록</a>
		<ul>
					
			<li><a href="prd_input_term.jsp">정기보험</a></li>
			<li><a href="prd_annu_input.jsp">연금보험</a></li>
			<li><a href="prd_prop_input.jsp">실손보험</a></li>
	    	
		</ul>
	</li>
</ul>
</body>

</html>

</html>