<%@page import="controller.CounselDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.CounselDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상담예약</title>
<link rel="stylesheet" href="../css/jquery-ui.css">
<link href="../wiz_style.css" rel="stylesheet" type="text/css" />
</head>
<style>
	.ui-datepicker { width: 242px; font-size:90%;}
	.ui-datepicker-calendar > tbody td:first-child a 
	{ 
		COLOR: #f00;
	}
	.ui-datepicker-calendar > tbody td:last-child a 
	{ 
		COLOR: blue; 
	}
</style>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

//멀티게시판 처리를 위한 파라미터 받기 및 경로 설정
String flag =  request.getParameter("flag")==null ? "c" : request.getParameter("flag");

//커넥션풀로 변경
CounselDAO dao = new CounselDAO();	

//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
Map<String,Object> param = new HashMap<String,Object>();
param.put("flag",flag);
//문자열 검색 파라미터를 페이지 처리 메소드로
//넘겨주기 위한 변수선언
/* String queryStr = "flag="+flag+"&"; */

String queryStr = "";


//폼값받기(검색관련)
String searchColumn = 
request.getParameter("searchColumn");
String searchWord = 
request.getParameter("searchWord");


if(searchWord!=null)
{
	//입력한 검색어가 있다면 맵에 추가함
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
	
	//파라미터 추가
	queryStr += String.format("searchColumn=%s"
		+"&searchWord=%s&", searchColumn,
			searchWord);
}
	
//페이지 처리를 위한 로직 시작
//1.게시판 테이블의 전체 레코드 갯수 구하기
/* int totalRecordCount = dao.getTotalRecordCount(param);  */

//2.web.xml에 설정된 값 가져오기
int pageSize = Integer.parseInt(
	application.getInitParameter("PAGE_SIZE"));
int blockPage = Integer.parseInt(
	application.getInitParameter("BLOCK_PAGE"));

/* //3.전체페이지수 계산하기
int totalPage = 
(int)Math.ceil((double)totalRecordCount/pageSize);  */

//4.페이지번호가 없는경우 무조건 1로 설정
int nowPage = 
  request.getParameter("nowPage")==null? 1 : Integer.parseInt(request.getParameter("nowPage"));

//5.가져올 레코드의 구간을 결정하기 위한 연산
int start = (nowPage-1)*pageSize + 1;
int end = nowPage * pageSize;

//6.파라미터 전달을 위해 map에 추가
param.put("start", start);
param.put("end", end);



/////게시판 페이지 처리 로직 끝

/*
게시판에서 레코드를 가져올때는 반드시 "List계열"의 
컬렉션을 사용해야 한다. Set계열의 컬렉션은 저장된 요소의
순서를 보장하지 않기때문에 게시판 목록을 구현할때 문제가 
될수있기 때문이다.
*/
List<CounselDTO> bbs = dao.selectList(param);

dao.close();

%>  
<body>
<%@include file="../include/head.jsp"%>

<div id="Container_wrap" class="right_close">
    <!--
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
    -->
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>
	
	<%@include file="../include/common_form.jsp" %>
	
    <div id="left_area">
	<%@include file="../include/form_left.jsp"%>
	</div><!-- //left_area// -->
	
	<div id="Container">
	
<div id="location">HOME > <%= path_str %></div>
<div id="S_contents">
<h3><%= path_str %><span>작성된 <%= path_str %>을 관리 합니다.</span></h3>	

<form action="http://demohome.anywiz.co.kr/adm/manage/form/form_list.php">
<input type="hidden" name="flag" value="<%=flag %>" />
<input type="hidden" name="nowPage" value="1" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
<tr>
  	<th width="15%">조건검색</th>
  	<td width="85%">
		<select name="searchstatus">
		<option value="">:: 처리상태 :: </option>
		<option value="대기중" >대기중</option>
		<option value="처리중" >처리중</option>
		<option value="처리완료" >처리완료</option>
		</select>
		<select name="searchopt">
		<option value="content">작성내용</option>
		</select>
		<input type="text" name="searchkey" value="" class="input">
		<button style="height:22px;vertical-align:bottom;" type="submit" class="b h28 t5 color blue_big">검색</button>
	</td>
</tr>
</table>
</form>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top10">
  <tr>
    <td>총 등록수 : <b>2</b></td>
  </tr>
</table>
<script type="text/javascript">
	 	// 체크박스 전체선택
	 	function selectAll(obj)
	 	{ 
	       var chkObj = document.getElementsByName("select_chkbox");
	       var rowCnt = chkObj.length-1;
	       var check = obj.checked;
	       if(check==true) 
	       {﻿
	           for (var i=0; i<=rowCnt; i++)
		       {
		          chkObj[i].checked = true; 
		       }
		       
	       }
	       else
    	   {
	    	   for (var i=0; i<=rowCnt; i++)
		       {
		          chkObj[i].checked = false; 
		       }
    	   }	
	 	}
	 	
	 	//선택삭제
		function formDelete()
	 	{
			var selvalue = document.getElementsByName("select_chkbox")
			
	 		if(selvalue == false)
	 		{
	 			alert("삭제할 메일을 선택하세요.");
	 			return false;
	 		}
	 		else
	 		{
	 			if(confirm("선택한 메일을 정말 삭제하시겠습니까?"))
	 			{
	 				var name ="";
 					for(var i=0; i<=selvalue.length-1; i++)
	 				{
	 					if(selvalue[i].checked)
 						{
	 						if(selvalue[i]=='undefined')
	 						{
		 						idx = selvalue[i].value;	 						
	 						}
		 					else
	 						{
		 						idx = idx + '-'+selvalue[i].value;
	 						}
		 					
 						}						
	 					
	 				}
 					document.location = "consult_delete_proc.jsp?idx="+idx		
	 				
	 			}
	 		}
	 	}
	 	
	 	
     
      </script>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
	<thead>
	<tr>
		<td width="5%"><input type="checkbox" name="select_all" onClick="selectAll(this);"></td>
		<td width="5%">번호</td>
		<td width="10%">이름</td>
		<td width="10%">모바일</td>
		<td width="15%">등록일</td>
		<td width="10%">상담내용</td>
		<td width="10%">분류</td>
	</tr>
	</thead>
	<tbody>
	<% if(bbs.isEmpty())
		{
	%>
	<tr>
		<td> 등록된 글이 없다</td>
	</tr>
	<% 	}
		else
		{
			int vNum = 0;
			int countNum = 0;
					
			for(CounselDTO dto : bbs)
			{//totalRecordCount
				vNum = 10 - (((nowPage-1)*pageSize)+countNum++);
	
	%>
			
		
  <input type="hidden" name="idx" value="167">
  <tr>
  		<td width="5%"><input type="checkbox" name="select_chkbox" value="<%=dto.getIdx() %>"></td>
   		<td width="5%"><%=dto.getIdx() %></td>
		<td width="10%"><%=dto.getName() %></td>
		<td width="10%"><%= dto.getMobile() %></td>
		<td width="10%"><%= dto.getRegidate() %></td>
		<td width="30%"><%= dto.getContents() %></td>
		<td width="5%"><%= dto.getFlag() %></td>
  </tr>
  <% 	}
	}%>
  </table>
  </form>


<table width="100%"border="0" cellpadding="0" cellspacing="0" class="top5">
  <tr>
    <td width="33%">
    <button type="button" class="h22 t4 small icon gray" onClick="formDelete();"><span class="icon_plus"></span>선택삭제</button>
    </td>
    <td width="33%">
    	<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=MformBasic&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>          <td width='22'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=MformBasic&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>          <td align='center'>&nbsp; <b>1</b> /           &nbsp; </td>          <td width='22' align='right'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=MformBasic&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>          <td width='22' align='right'><a href='form_list.jsp?ptype=&amp;page=1&amp;code=MformBasic&amp;searchopt=&amp;searchkey=&amp;searchstatus='><img src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>        </tr>      </table>    </td></tr></table></td>
    <td width="33%"></td>
  </tr>
</table>
</div>
</div>

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>