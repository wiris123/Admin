<%@page import="dto.AnnuDTO"%>
<%@page import="dto.TermDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="controller.InsuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글처리
   request.setCharacterEncoding("UTF-8");
 
   //커넥션풀로 변경
   InsuDAO dao = new InsuDAO();   
   
   //매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
   Map<String,Object> param = new HashMap<String,Object>();
   
   //문자열 검색 파라미터를 페이지 처리 메소드로
   //넘겨주기 위한 변수선언
   String queryStr = "";
   queryStr += "";
   
   
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
   int totalRecordCount = dao.getTotalRecordCount(param); 
   
   //2.web.xml에 설정된 값 가져오기
   int pageSize = Integer.parseInt(
      application.getInitParameter("PAGE_SIZE"));
   int blockPage = Integer.parseInt(
      application.getInitParameter("BLOCK_PAGE"));
   
   //3.전체페이지수 계산하기
   int totalPage = 
   (int)Math.ceil((double)totalRecordCount/pageSize);
   
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
   List<AnnuDTO> bbs = dao.selectList1(param);
   
   dao.close();

%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="../../css/jquery-ui.css">
<script src="../../js/jquery-1.10.2.js"></script>
<script src="../../js/jquery-ui.js"></script>
<!-- <script src="../../js/jquery.highchartTable.js"></script> -->
<!-- <script src="../../js/highcharts.js"></script> -->
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
   $(function() {
      $( "#datepicker1" ).datepicker({
         dateFormat: 'yy-mm-dd',
            //yearSuffix: '년',
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
            changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
            showMonthAfterYear: true // 년월 셀렉트 박스 위치 변경
            //altField: "#date", // 타겟 필드
            //minDate: '-0d', // 오늘 이전 날짜는 선택 못함
            
      });
   });
   $(function() {
      $( "#datepicker2" ).datepicker({
         dateFormat: 'yy-mm-dd',
            //yearSuffix: '년',
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
            changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
            showMonthAfterYear: true // 년월 셀렉트 박스 위치 변경
            //altField: "#date", // 타겟 필드
            //minDate: '-0d', // 오늘 이전 날짜는 선택 못함
            
      });
   });

   $(document).ready(function(){

    if($.cookie("left_quick") == "close"){
      $('#Container_wrap').addClass('left_close'); 
    }else{
      $('#Container_wrap').removeClass('left_close'); 

    }


   });

   function leftBtn() {
      $('#Container_wrap').toggleClass('left_close');   
      if ($('#Container_wrap').hasClass('left_close')) {
         $.cookie('left_quick', 'close', { expires: 1, path: '/', domain: 'demohome.anywiz.co.kr', secure: false });
      }
      else {
         $.cookie('left_quick', 'open', { expires: 1, path: '/', domain: 'demohome.anywiz.co.kr', secure: false });         
      }
   }
</script>
</head>
<body>
   <!-- 헤드부분 -->
   <%@include file="../include/head.jsp"%>
   <!-- 레프트메뉴 -->
   <%@include file = "../include/product_left.jsp" %>
   </div><!-- //left_area// -->

   <div id="Container">
    

<script language="JavaScript" type="text/javascript">



</script>

<div id="location">HOME > 상품관리</div>
<div id="S_contents">
<h3>상품관리<span>상품 검색/추가/수정/삭제 관리합니다.</span></h3>	

      <form name="searchForm" action="http://demohome.anywiz.co.kr/adm/manage/product/prd_list.php" method="get">
      <input type="hidden" name="page" value="">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
      <tr>
      <th width="15%">상품분류</th>
      <td width="85%">
         <select name="dep_code" onChange="catChange(this.form,'1');">
         <option value=''>:: 대분류 ::
         <option value='100'>상품분류1<option value='101'>상품분류2<option value='102'>상품분류3         </select>
         <select name="dep2_code" onChange="catChange(this.form,'2');" class="select">
         <option value=''> :: 중분류 ::
                  </select>
         <select name="dep3_code" onChange="catChange(this.form,'3');" class="select">
         <option value=''> :: 소분류 ::
                  </select>
         <input type="checkbox" name="recom" value="Y" >추천상품
      </td>
      </tr>
      <tr>
      <th>조건검색</th>
      <td>
         <select name="searchopt" class="select">
         <option value="prdnum" >상품코드
         <option value="prdname" >상품명
         </select>
         <input type="text" name="searchkey" value="" class="input"> <button style="height:22px;vertical-align:bottom;" type="submit" class="b h28 t5 color blue_big">검색</button>
         <script language="javascript">
         searchopt = document.searchForm.searchopt;
         for(ii=0; ii<searchopt.length; ii++){
           if(searchopt.options[ii].value == "")
             searchopt.options[ii].selected = true;
         }
         </script>
      </td>
      </tr>
      </table>
      </form>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="top10">
        <tr>
          <td>총 상품수 : <b>1</b> , 검색 상품수 : <b>1</b></td>
          <td align="right">
            <button type="button" class="h22 t4 small icon gray" onClick="document.location='prd_annu_input.jsp';"><span class="icon_plus"></span>상품등록</button>
          </td>
        </tr>
      </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
         <form>
         <script type="text/javascript">

       //전체선택
         function selectAll(obj) {
         	var chkObj = document.getElementsByName("select_chkbox");
         	var rowCnt = chkObj.length - 1;
         	// 대가리에 노드를 체크로 전환시
         	if (obj.checked == true) {
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

         // 선택삭제
         function prdDelete() {
         	var selvalue = document.getElementsByName("select_chkbox")
         	var name= null;
         	//한번 for문으로 훑어서 체크된값이 있다면 name 에 저장
         	for (var i = 0; i <= selvalue.length-1; i++) {
         		if (selvalue[i].checked) {
         			if(name==null) name='-' + selvalue[i].value;
         			else name +=  '-' + selvalue[i].value;
         		}
         	}
         	//없었다면
         	if (name == null) {
         		alert("삭제할 상품을 선택하세요.");
         		return false;
         	} 
         	
         	//있다면 다시한번 삭제할것인지 확인
         	else 
         	{
         		if (confirm("선택한 상품을 정말 삭제하시겠습니까?")) {
         			document.location = "./proc/prd_del_annu.jsp?ann_name=" + name
         		}
         	}
         }

         	//체크박스 전체선택
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
		function prdDelete()
	 	{
			var selvalue = document.getElementsByName("select_chkbox")
			
	 		if(selvalue.checked == false && selvalue.value==null )
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
 					document.location = "./proc/prd_del_annu.jsp?ann_name="+name		
	 				
	 			}
	 		}
	 	}
         </script>
         
         <thead>

		</table>


     
	<form>
	<thead>
      <tr>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
         <form>
         <thead>
        <tr>

           <td width="5%"><input type="checkbox" name="select_all" onClick="selectAll(this)"></td>
          <td width="15%">상품명</td>
          <td width=15%>연금게시일</td>
          <td width="10%">연금납부연한</td>
          <td width="10%">월납입액</td>
          <td width="10%">위험할증률</td>
          <td width="10%">보장수익률</td>
          <td width="15%">매월 연금수령액</td>
        </tr>
      </thead>
      </form>
      <tbody>
      <%
if(bbs.isEmpty()){
   //컬렉션에 저장된 데이터가 없는경우
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
   //컬렉션에 저장된 데이터가 있는경우 for-each문을통해
   //내용 출력
   int vNum = 0;
   int countNum = 0;
         

   for(AnnuDTO dto : bbs)
   {
      //게시물의 번호를 순서대로 출력하기위한
      //가상번호 생성(게시물의 갯수를 기준)
      vNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);

%>
        <tr>
           <td width="5%"><input type="checkbox" name="select_chkbox" value="<%=dto.getAnn_name()%>"></td>
          <td width="15%"><%= dto.getAnn_name() %></td>
          <td width="15%"><%= dto.getInstart() %></td>
          <td width="10%"><%= dto.getPaytime()%></td>
          <td width="10%"><%= dto.getPayment() %></td>
          <td width="10%"><%= dto.getRprem()%></td>
          <td width="10%"><%= dto.getInterest()%></td>
          <td width="15%"><%= dto.getMonthann()%></td>
        </tr>

<%    } 
}%>
 </tbody>
</table>

<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="33%">
<button type="button" class="h22 t4 small icon gray" onClick="prdDelete();"><span class="icon_plus"></span>선택삭제</button>
<button type="button" class="h22 t4 small icon gray" onClick="movePrd();"><span class="icon_plus"></span>상품이동</button>
<button type="button" class="h22 t4 small icon gray" onClick="copyPrd();"><span class="icon_plus"></span>상품복사</button>
</td>
<td width="33%">    <table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>          <td width='22'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>          <td align='center'>&nbsp; <b>1</b> /           &nbsp; </td>          <td width='22' align='right'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>          <td width='22' align='right'><a href='prd_list607e.html?ptype=&amp;page=1&amp;dep_code=&amp;dep2_code=&amp;dep3_code=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>        </tr>      </table>    </td></tr></table></td>
<td width="33%" align="right"></td>
</tr>
</table>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

<!-- Mirrored from demohome.anywiz.co.kr/adm/manage/product/prd_list.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Aug 2018 09:11:57 GMT -->
</html>


</body>
</html>