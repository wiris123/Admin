<%@page import="dto.MemberDTO"%>
<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

MemberDAO dao = new MemberDAO();

Map<String,Object> param = new HashMap<String,Object>();

String queryStr = "";

String searchColumn = 
request.getParameter("searchColumn");
String searchWord = 
request.getParameter("searchWord");
if(searchWord!=null){
//입력한 검색어가 있다면 맵에 추가함
param.put("Column", searchColumn);
param.put("Word", searchWord);

//파라미터 추가
queryStr = String.format("searchColumn=%s"
	+"&searchWord=%s&", searchColumn,
		searchWord);
}

int totalRecordCount = dao.getTotalRecordCount(param); 

//2.web.xml에 설정된 값 가져오기
int pageSize = Integer.parseInt(
	application.getInitParameter("PAGE_SIZE"));
int blockPage = Integer.parseInt(
	application.getInitParameter("BLOCK_PAGE"));

int totalPage = 
(int)Math.ceil((double)totalRecordCount/pageSize);

//4.페이지번호가 없는경우 무조건 1로 설정
int nowPage = 
  request.getParameter("nowPage")==null
  ? 1 : 
  Integer.parseInt(request.getParameter("nowPage"));

//5.가져올 레코드의 구간을 결정하기 위한 연산
int start = (nowPage-1)*pageSize + 1;
int end = nowPage * pageSize;

//6.파라미터 전달을 위해 map에 추가
param.put("start", start);
param.put("end", end);

String pagingImg = PagingUtil.pagingImgServlet(
		totalRecordCount,pageSize,
		blockPage, nowPage, 
		"member_List.jsp?"+queryStr);

List<MemberDTO> bbs = dao.selectList(param);

dao.close();
%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>홈페이지 관리자</title>
<link rel="stylesheet" href="../../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<!-- <script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script> -->
<script src="../../js/jquery.bpopup.min.js"></script>
<script src="../../js/jquery.cookie.js"></script>
<link href="../wiz_style.css" rel="stylesheet" type="text/css"/>
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
<script>
//체크박스 전체선택
	function selectAll(obj) //obj = 전체선택 체크박스
	{
   var chkObj = document.getElementsByName("select_tmp");//개별체크박스 이름으로 가져오기
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
function prdDelete()
	{
	var selvalue = document.getElementsById("select_tm")
	
		if(selvalue.checked == null)
		{
			alert("삭제할 상품을 선택하세요.");
			return false;
		}
		else
		{
			if(confirm("선택한 상품을 정말 삭제하시겠습니까?"))
			{
				var name ="";
				for(var i=0; i<=selvalue.length-1; i++)
				{
					if(selvalue[i].checked)
					{
						if(selvalue[i]=='undefined')
						{
 						name = selvalue[i].value;	 						
						}
 					else
						{
 						name = name + '-'+selvalue[i].value;
						}
 					
					}						
					
				}
				document.location = "member_del_proc.jsp?id="+name		
				
			}
		}
	}
</script>
</head>
<body class="home_body">

<%@include file="../include/head.jsp"%>

<%@include file="../include/member_left.jsp"%>

</div>

<div id="Container">

<div id="location">HOME > 회원관리</div>
	<div id="S_contents">
	<h3>회원관리<span>회원을  관리합니다.</span></h3>	 
		<form name="form-inline">
		<input type="hidden" name="nowPage" value="1" />
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
				<tr>
					<th width="15%">조건검색</th>
					<td align="left" width="85%">
						<select name="searchColumn" class="form-control">
		         			<option value="name">고객명</option>
		         			<option value="id">아이디</option>
		     			</select>
						<input type="text" name="searchWord" value="" class="form-control">
							<button type="submit" style="height:22px" class="b h28 t5 color blue_big">검색</button>
					</td>
		       </tr>
	       </table>
		</form>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top15">
			<tr>
				<td align="right">
					<button type="button" class="h22 t4 small icon gray" onClick="document.location='member_write.jsp';"><span class="icon_plus"></span>회원등록</button>
					<button type="button" class="h22 t4 small icon gray" onClick="prdDelete()"><span class="icon_plus"></span>회원삭제</button>
				</td>
			</tr>
		</table>
		<form>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2" >
	        	<thead> 
	        		<tr class="success">
						<td width="5%"><input type="checkbox" name="select_tmp" id="select_tm"  onClick="selectAll(this)"/></td>
						<td width="5%">번호</td>
						<td>아이디</td>
						<td width="15%">패스워드</td>
						<td width="15%">이름</td>
						<td width="15%">이메일</td>
						<td width="5%">전화번호</td>
						<td width="10%">생일</td>
						<td width="10%">가입일</td>
					</tr>
				</thead> 
				<tbody> 
					<%
					if(bbs.isEmpty()){
					%>
						<tr>
							<td colspan="5" align="center">
								등록된 게시물이 없습니다
							</td>
						</tr>
					<%
					}
					else
					{
						int vNum = 0;
						int countNum = 0;
						for(MemberDTO dto : bbs){
			
							vNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
					%>
		
						<tr>
							<td><input type="checkbox" name="select_tmp"  id="select_tm" value="<%=dto.getId()%>"/></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=vNum %></a></td>
							<td class="text-left"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getId() %></a></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getPass() %></a></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getName() %></a></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getEmail() %></a></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getMobile() %></a></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getBirth() %></a></td>
							<td class="text-center"><a href="member_view.jsp?id=<%=dto.getId()%>&nowPage=<%=nowPage %>"><%=dto.getRegidate() %></a></td>
						</tr>
		
					<%
						}
					}
					%>  
	      		</tbody> 
			</table>
		</form>	
	      
		<div class="row text-center" style="text-align:center">
			<ul class="pagination">
				<%=pagingImg %>
			</ul>	
		</div>
	</div>
</div><!-- //Container// -->


	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

</html>
