
<%@page import="util.PagingUtil"%>
<%@page import="dto.OutMemDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");

MemberDAO dao = new MemberDAO();

//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
Map<String,Object> param = new HashMap<String,Object>();

//문자열 검색 파라미터를 페이지 처리 메소드로
//넘겨주기 위한 변수선언
String queryStr = "";


//폼값받기(검색관련)
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


//페이지 처리를 위한 로직 시작
//1.게시판 테이블의 전체 레코드 갯수 구하기
int totalRecordCount = 
	dao.getTotalRecordCount2(param); 

//2.web.xml에 설정된 값 가져오기
int pageSize = 10;
int blockPage = 5;

//3.전체페이지수 계산하기
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

List<OutMemDTO> bbs = dao.selectList2(param);

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
<script src="../../js/jquery.highchartTable.js"></script>
<script src="../../js/highcharts.js"></script>
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
function selectAll(obj) {
  	var chkObj = document.getElementsByName("select_chkbox");
  	var rowCnt = chkObj.length - 1;
  	// 대가리에 노드를 체크로 전환시
  	if (topcheckbox.checked == true) {
  		// 전부 선택으로 바꿔줌
  		for (var i = 0; i <= rowCnt; i++) {
  			chkObj[i].checked = true;
  		}
  		// 체크 해제시
  	} else {
  		// 전부 체크 해제
  		for (var i = 0; i <= rowCnt; i++) {
  			chkObj[i].checked = false;
  		}
  	}
  }

</script>
	
</head>

<body class="home_body">

<%@include file="../include/head.jsp"%>

<%@include file="../include/member_left.jsp"%>


</div><!-- //left_area// -->

<div id="Container">

</head>

<div id="location">HOME > 회원관리</div>
	<div id="S_contents">
		<h3>탈퇴회원<span>탈퇴회원을 조회 관리합니다.</span></h3>	 

			<form name="form-inline">
				<input type="hidden" name="nowPage" value="1" />
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
					<tr>
						<th width="15%">조건검색</th>
						<td align="left" width="85%">
							<select name="searchColumn" class="form-control">
			         			<option value="reason">탈퇴사유</option>
			         			<option value="id">회원명</option>
			     			</select>
							<input type="text" name="searchWord" value="" class="form-control">
								<button type="submit" style="height:22px" class="b h28 t5 color blue_big">검색</button>
						</td>
					</tr>
				</table>
			</form>
			<form>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
					<thead> 
						<tr class="success">
							<td width="5%"><input type="checkbox" name="select_tmp" onClick="selectAll(this)"/></td>
							<td>번호</td>
							<td>회원명</td>
							<td>탈퇴사유</td>
							<td>탈퇴일</td>
							<td>삭제</td>			  
        				</tr>
       				</thead> 
					<tbody> 
					
					<!--리스트 보여주기  -->      
					<%
					if(bbs.isEmpty()){
					%>
						<tr>
							<td colspan="5" align="center">
								등록된 게시물이 없습니다^^*
							</td>
						</tr>
					<%
					}
					else
					{
						int vNum = 0;
						int countNum = 0;
						for(OutMemDTO dto : bbs){
			
							vNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
					%>
		
						<!--리스트 반복  -->
						<tr>
							<td><input type="checkbox" name="select_chkbox" value="<%=dto.getId()%>"/></td>
							<td class="text-center"><%=vNum %></td>
							<td class="text-center"><%=dto.getId() %></td>
							<td class="text-center"><%=dto.getReason() %></td>
							<td class="text-center"><%=dto.getRegidate() %></td>
							<td><button type="submit" style="height:22px" class="b h28 t5 color blue_big" onClick="prdDelete()">삭제</button></td>
						</tr>
	
					<%
						}
					}
					%>  
		       
		       
		       		<!--리스트 반복끝  -->
     				</tbody>
      			</table>
			</form>
      		<div class="row text-center" style="text-align:center">
				<ul class="pagination">
					<%=PagingUtil.pagingImgServlet(totalRecordCount,pageSize,blockPage,nowPage,"out_list.jsp?"+queryStr) %>
				</ul>	
			</div>
	</div>
	</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

	<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>


</html>
