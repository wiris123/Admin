<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

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
<body class="home_body">
<%@include file="../include/head.jsp"%>
<!-- <div id="Header">
	<h1><a href="../main/main.html" onFocus="this.blur();"><img src="../image/header/logo.png" /></a></h1>
    <ul id="gnb">
    	<li class="first"><a target="_blank" href="http://demohome.anywiz.co.kr/" onFocus="this.blur();">내홈페이지</a></li>
    	<li><a href="../main/main.html" onFocus="this.blur();">관리자홈</a></li>
    	<li><a href="../../logout.html" onFocus="this.blur();" class="logbtn"><img src="../image/header/logout.gif" /></a></li>
    </ul>
    <div id="navi">
    	<li class="design">
			          
		</li>
						<li>
			<a href="../basic/site_info.html" onFocus="this.blur();"><span>기본설정</span></a>
        	<ul class="category">
				<li>
					<a href="../basic/site_info.html">사이트정보</a>
				</li>
				<li>
					<a href="../basic/admin_list.html">관리자설정</a>
				</li>
				<li>
					<a href="../basic/popup_list.html">팝업관리</a>
				</li>
								<li>
					<a href="../basic/sms_fill.html">SMS관리</a>
				</li>
							</ul>
		</li>
                  

				<li>
			<a href="../bbs/bbs_list.html" onFocus="this.blur();"><span>게시판관리</span></a>          	
        	<ul class="category">
        		<li>
					<a href="../bbs/bbs_list.html">게시판관리</a>
				</li>
				<li>
					<a href="../bbs/bbs_manage_list.html">게시물통합관리</a>
				</li>
				<li>
					<a href="../bbs/bbs_manage_comment.html">코멘트통합관리</a>
				</li>
				<li>
					<a href="../bbs/bbs_connect.html">게시판통계</a>
				</li>
			</ul>
		</li>
    	
				<li>
			<a href="member_list.jsp" onFocus="this.blur();"><span>회원관리</span></a>
			<ul class="category">
				<li>
					<a href="member_list.jsp">회원목록</a>
				</li>

				<li>
					<a href="out_list.jsp">탈퇴회원</a>
				</li>

				<li>
					<a href="mail_list.html">메일,SMS설정</a>
				</li>
				<li>
					<a href="mail_test.html">메일발송테스트</a>
				</li>
				<li>
					<a href="mail_send.html">단체메일발송</a>
				</li>

								<li>
					<a href="sms_send.html">단체SMS발송</a>
				</li>
								<li>
					<a href="member_analy.html">회원통계</a>
				</li>
				<li>
					<a href="member_config.html">가입약관, 개인정보보호정책</a>
				</li>
											</ul>
		</li>    
		
       			<li>
			<a href="../form/form_list.jsp" onFocus="this.blur();"><span>폼메일관리</span></a>
        	<ul class="category">
				<li>
					<a href="../form/form_list.jsp">폼메일관리</a>
				</li>
				<li class="depth"><a href="#" onFocus="this.blur();">폼메일목록</a>
					<ul class="category_2depth">
												<li><a href="../form/form_listc257.jsp?code=formBasic">폼메일</a></li>
												<li><a href="../form/form_list4213.jsp?code=MformBasic">모바일_폼메일</a></li>
											</ul>
				</li>
			</ul>
		</li>
        
	    		<li>
			<a href="../poll/pollinfo_list.html"><span>설문관리</span></a>
			<ul class="category">
				<li>
					<a href="../poll/pollinfo_list.html">설문관리</a>
				</li>
				<li class="depth"><a href="#" onFocus="this.blur();">설문목록</a>
					<ul class="category_2depth">
													<li><a href="../poll/poll_list12b9.html?code=poll">설문조사</a></li>
											</ul>
				</li>

			</ul>		
		</li>
        		
		        <li>		    
			<a href="../schedule/sch_list.html"><span>스케쥴관리</span></a>        
			<ul class="category">
				<li>
					<a href="../schedule/sch_list.html">스케쥴관리</a>
				</li>
				<li class="depth"><a href="#" onFocus="this.blur();">스케쥴목록</a>
					<ul class="category_2depth">
													<li><a href="../schedule/list6b41.html?code=schedule">스케쥴</a></li>
											</ul>
				</li>

			</ul>				
		</li>
        	

				<li>
		    
			<a href="../page/page_list.html"><span>페이지관리</span></a>
			<ul class="category">
				<li>
					<a href="../page/page_list.html">페이지관리</a>
				</li>
				<li class="depth"><a href="#" onFocus="this.blur();">페이지목록</a>
					<ul class="category_2depth">
									<li><a href="../page/page_input8312.html?mode=update&amp;idx=25">회사소개</a></li>
									<li><a href="../page/page_input5b7c.html?mode=update&amp;idx=26">인사말</a></li>
									<li><a href="../page/page_inputac2f.html?mode=update&amp;idx=27">이용약관</a></li>
									<li><a href="../page/page_input2bac.html?mode=update&amp;idx=28">개인정보취급방침</a></li>
									</ul>
				</li>
			</ul>	
            
		</li>
		
				<li>    
			<a href="../banner/banner_list.html"><span>배너관리</span></a></td>
			<ul class="category">
				<li>
					<a href="../banner/banner_list.html">배너관리</a>
				</li>
				<li class="depth"><a href="#" onFocus="this.blur();">배너목록</a>
					<ul class="category_2depth">
									<li><a href="../banner/liste65e.html?code=customer">고객센터</a></li>
									</ul>
				</li>
			</ul>
		</li>
				
		
				<li>           
			<a href="../connect/connect_list.jsp" onFocus="this.blur();"><span>접속통계</span></a>
        	<ul class="category">
				<li>
					<a href="../connect/connect_list.jsp">접속자분석</a>
				</li>

				<li>
					<a href="../connect/connect_refer.html">접속경로분석</a>
				</li>

				<li>
					<a href="../connect/connect_keyword.html">검색키워드분석</a>
				</li>
				<li>
					<a href="../connect/connect_osbrowser.html">OS/브라우저</a>
				</li>
			</ul>
		</li>
    	
		<li>           
			<a href="../product/prd_list.html" onFocus="this.blur();"><span>상품관리</span></a>
        	<ul class="category">
				<li>
					<a href="../product/prd_list.html">상품목록</a>
				</li>

				<li>
					<a href="../product/prd_input.html">상품등록</a>
				</li>

				<li>
					<a href="../product/prd_cat.html">상품분류</a>
				</li>
				
			</ul>
		</li>
    		
    	

    </div>
</div> -->


<%@include file="../include/member_left.jsp"%>
<!-- 
<div id="Container_wrap" class="right_close">
    
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
   
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>

    <div id="left_area">
		



<h2><img src="../image/header/icon3.png" alt=""> 회원관리</h2>
<ul id="Lnb">
	<li class="on"><a href="member_list.jsp" onFocus="this.blur();">회원관리</a>
		<ul>
			<li class="">
				<a href="member_list.jsp">회원목록</a>
			</li>
			<li>
				<a href="level_list.html">회원등급</a>
			</li>
		 	<li>
				<a href="out_list.jsp">탈퇴회원</a>
			</li>
			
		</ul>
	</li>
		</ul>

 -->







	</div><!-- //left_area// -->

	<div id="Container">
    




















<script language="JavaScript" type="text/javascript">
<!--

// 체크박스 전체선택
function selectAll(){
	var i;
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].elements['id'] != null){
			if(document.forms[i].select_checkbox){
				document.forms[i].select_checkbox.checked = true;
			}
		}
	}
	return;
}

// 체크박스 선택해제
function selectCancel(){
	var i;
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].select_checkbox){
			if(document.forms[i].elements['id'] != null){
				document.forms[i].select_checkbox.checked = false;
			}
		}
	}
	return;
}

// 체크박스선택 반전
function selectReverse(form){
	if(form.select_tmp.checked){
		selectAll();
	}else{
		selectCancel();
	}
}

// 체크박스 선택리스트
function selectValue(){
	var i;
	var seluser = "";
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].elements['id'] != null){
			if(document.forms[i].select_checkbox){
				if(document.forms[i].select_checkbox.checked)
					seluser = seluser + document.forms[i].elements['id'].value + "|";
				}
			}
	}
	return seluser;
}

//선택회원 삭제
function delUser(){

	seluser = selectValue();

	if(seluser == ""){
		alert("삭제할 회원을 선택하세요.");
		return false;
	}else{
		if(confirm("선택한 회원을 정말 삭제하시겠습니까?")){
			document.location = "member_save5862.html?mode=deluser&amp;seluser=" + seluser;
		}
	}
}

// 고객 메일발송
function sendMail(seluser, seluser_info){

	if(seluser == ""){
		var i;
		var seluser = "";
		var seluser_info = "";
		for(i=0;i<document.forms.length;i++){
			if(document.forms[i].elements['id'] != null){
				if(document.forms[i].select_checkbox){
					if(document.forms[i].select_checkbox.checked)
						seluser = seluser + document.forms[i].name.value + ":" + document.forms[i].email.value + ",";
						seluser_info = seluser_info + document.forms[i].elements['id'].value + ":" + document.forms[i].passwd.value + ",";
				}
			}
		}
	}

  if(seluser == ""){
		alert("이메일 발송할 회원을 선택하세요.");
		return false;
	}else{
	   var url = "mail_popupc0ca.html?seluser=" + seluser + "&seluser_info=" + seluser_info;
	   window.open(url,"sendMail","height=740, width=800, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, top=100, left=100");
	}

}

// 고객 SMS발송
function sendSms(seluser){

	if(seluser == ""){
		var i;
		var seluser = "";
		for(i=0;i<document.forms.length;i++){
			if(document.forms[i].hphone != null){
				if(document.forms[i].select_checkbox){
					if(document.forms[i].select_checkbox.checked)
						seluser = seluser + document.forms[i].hphone.value + ",";
				}
			}
		}
	}

  if(seluser == ""){
		alert("SMS 발송할 회원을 선택하세요.");
		return false;
	}else{
	   var url = "sms_popupc0ca.html?seluser=" + seluser;
	   window.open(url,"sendSms","height=400, width=400, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, top=100, left=100");
	}

}

// 회원정보 엑셀다운
function excelDown(){
	document.location = "%c8%b8%bf%f8%c1%a4%ba%b8%5b20180808%5df5f7.xls?sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey=";
}

// 회원정보 엑셀입력
function excelUp() {
	var url = "member_excel_up.html";
	window.open(url,"excelUp","height=330, width=560, menubar=no, scrollbars=no, resizable=no, toolbar=no, status=no, top=100, left=100");
}

// 선택회원 메일발송
function setMail(no) {
	var frm = eval("document.frm" + no);

	frm.select_checkbox.checked = true;
	sendMail('');

}

//-->
</script>

<div id="location">HOME > 회원관리</div>
<div id="S_contents">
<h3>회원관리<span>회원을 검색/수정 관리합니다.</span></h3>	 

     <form name="searchForm" action="http://demohome.anywiz.co.kr/adm/manage/member/member_list.php" method="get">
	  <input type="hidden" name="page" value="">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
      <tr>
      <th width="15%">조건검색</th>
      <td align="left" width="85%">
         <select name="slevel">
         <option value=""> :: 등급선택 ::</option>
         <option value='1'>일반회원</option><option value='3'>정회원</option><option value='2'>우수회원</option>         </select>
         <select name="searchopt" class="select">
         <option value="name">고객명</option>
         <option value="id">아이디</option>
         <option value="email">이메일</option>
         <option value="tphone">전화번호</option>
         <option value="hphone">휴대폰</option>
         </select>
			<input type="text" name="searchkey" value="" class="input">
			<button type="submit" style="height:22px" class="b h28 t5 color blue_big">검색</button>
		</td>
       </tr>
       <tr>
      <th>가입일</th>
      <td>
			<input class="input w100" type="text" id="datepicker1" name="sdate" value="" >
			<input type="button" class="btn_calendar" id=""/> ~
			<input class="input w100" type="text" id="datepicker2" name="edate" value="" >
			<input type="button" class="btn_calendar" id=""/>
      </td>
      </tr>
       </table>

       <script language="javascript">
       <!--
       slevel = document.searchForm.slevel;
       for(ii=0; ii<slevel.length; ii++){
         if(slevel.options[ii].value == "")
           slevel.options[ii].selected = true;
       }
       searchopt = document.searchForm.searchopt;
       for(ii=0; ii<searchopt.length; ii++){
         if(searchopt.options[ii].value == "")
           searchopt.options[ii].selected = true;
       }
       -->
       </script>

     </td>
     </tr>
     </table>
	 </form>

            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="top15">
        <tr>
          <td>총 회원수 : <b>4</b> , 검색 회원수 : <b>4</b></td>
          <td align="right">
			  <button type="button" class="h22 t4 small icon gray" onClick="excelDown();"><span class="icon_exel"></span>엑셀파일저장</button>
			  <button type="button" class="h22 t4 small icon gray" onClick="excelUp();"><span class="icon_exel"></span>회원엑셀등록</button>
			  <button type="button" class="h22 t4 small icon gray" onClick="document.location='input2e57.html?mode=insert';"><span class="icon_plus"></span>회원등록</button>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bbs_basic_list top2">
        <form>
        <thead> 
        <tr>
          <td width="5%"><input type="checkbox" name="select_tmp" onClick="selectReverse(this.form)"></td>
          <td width="5%">번호</td>
          <td>이름</td>
          <td width="15%">아이디</td>
          <td width="15%">휴대폰</td>
          <td width="15%">이메일</td>
          <td width="5%">방문수</td>
          <td width="10%">가입일</td>
          <td width="10%">기능</td>
        </tr>
        </thead> 
        </form>
		<tbody> 
			      <form name="frm4">
        <input type="hidden" name="id" value="test5">
        <input type="hidden" name="name" value="김민수">
        <input type="hidden" name="email" value="vg2001@naver.com">
        <input type="hidden" name="hphone" value="010-222-444">
        <input type="hidden" name="passwd" value="098f6bcd4621d373cade4e832627b4f6">
        <tr>
          <td height="30" align="center"><input type="checkbox" name="select_checkbox"></td>
          <td align="center">4</td>
          <td align="center">김민수</td>
          <td align="center">test5</td>
          <td align="center"><a href=javascript:sendSms('010-222-444');>010-222-444</a></td>
          <td align="center">
          	<!--a href="javascript:sendMail('김민수:vg2001@naver.com', 'test5:098f6bcd4621d373cade4e832627b4f6')">vg2001@naver.com</a//-->
          	<a href="javascript:setMail('4')">vg2001@naver.com</a>
          </td>
          <td align="center">0</td>
          <td align="center">2016-07-27 &nbsp;</td>
          <td align="center">
			<button type="button" class="h18 t3 color small round red_s" onclick="location.href='input391c.html?mode=update&amp;idx=109&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='">보기</button>
		  </td>
        </tr>
        
        </form>
      	      <form name="frm3">
        <input type="hidden" name="id" value="test2">
        <input type="hidden" name="name" value="테스트2">
        <input type="hidden" name="email" value="test2@test.com">
        <input type="hidden" name="hphone" value="010-0000-0000">
        <input type="hidden" name="passwd" value="ad0234829205b9033196ba818f7a872b">
        <tr>
          <td height="30" align="center"><input type="checkbox" name="select_checkbox"></td>
          <td align="center">3</td>
          <td align="center">테스트2</td>
          <td align="center">test2</td>
          <td align="center"><a href=javascript:sendSms('010-0000-0000');>010-0000-0000</a></td>
          <td align="center">
          	<!--a href="javascript:sendMail('테스트2:test2@test.com', 'test2:ad0234829205b9033196ba818f7a872b')">test2@test.com</a//-->
          	<a href="javascript:setMail('3')">test2@test.com</a>
          </td>
          <td align="center">0</td>
          <td align="center">2016-05-25 &nbsp;</td>
          <td align="center">
			<button type="button" class="h18 t3 color small round red_s" onclick="location.href='inputd75b.html?mode=update&amp;idx=107&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='">보기</button>
		  </td>
        </tr>
        
        </form>
      	      <form name="frm2">
        <input type="hidden" name="id" value="test">
        <input type="hidden" name="name" value="테스트">
        <input type="hidden" name="email" value="test@test.com">
        <input type="hidden" name="hphone" value="010-0000-0000">
        <input type="hidden" name="passwd" value="098f6bcd4621d373cade4e832627b4f6">
        <tr>
          <td height="30" align="center"><input type="checkbox" name="select_checkbox"></td>
          <td align="center">2</td>
          <td align="center">테스트</td>
          <td align="center">test</td>
          <td align="center"><a href=javascript:sendSms('010-0000-0000');>010-0000-0000</a></td>
          <td align="center">
          	<!--a href="javascript:sendMail('테스트:test@test.com', 'test:098f6bcd4621d373cade4e832627b4f6')">test@test.com</a//-->
          	<a href="javascript:setMail('2')">test@test.com</a>
          </td>
          <td align="center">10</td>
          <td align="center">2016-05-25 &nbsp;</td>
          <td align="center">
			<button type="button" class="h18 t3 color small round red_s" onclick="location.href='inputb976.html?mode=update&amp;idx=106&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='">보기</button>
		  </td>
        </tr>
        
        </form>
      	      <form name="frm1">
        <input type="hidden" name="id" value="test3">
        <input type="hidden" name="name" value="테스트3">
        <input type="hidden" name="email" value="test@test.com">
        <input type="hidden" name="hphone" value="010-0000-0000">
        <input type="hidden" name="passwd" value="8ad8757baa8564dc136c1e07507f4a98">
        <tr>
          <td height="30" align="center"><input type="checkbox" name="select_checkbox"></td>
          <td align="center">1</td>
          <td align="center">테스트3</td>
          <td align="center">test3</td>
          <td align="center"><a href=javascript:sendSms('010-0000-0000');>010-0000-0000</a></td>
          <td align="center">
          	<!--a href="javascript:sendMail('테스트3:test@test.com', 'test3:8ad8757baa8564dc136c1e07507f4a98')">test@test.com</a//-->
          	<a href="javascript:setMail('1')">test@test.com</a>
          </td>
          <td align="center">11</td>
          <td align="center">2016-04-12 &nbsp;</td>
          <td align="center">
			<button type="button" class="h18 t3 color small round red_s" onclick="location.href='input8afe.html?mode=update&amp;idx=100&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='">보기</button>
		  </td>
        </tr>
           <tr>
          <td height="30" align="center"><input type="checkbox" name="select_checkbox"></td>
          <td align="center">1</td>
          <td align="center">테스트3</td>
          <td align="center">test3</td>
          <td align="center"><a href=javascript:sendSms('010-0000-0000');>010-0000-0000</a></td>
          <td align="center">
          	<!--a href="javascript:sendMail('테스트3:test@test.com', 'test3:8ad8757baa8564dc136c1e07507f4a98')">test@test.com</a//-->
          	<a href="javascript:setMail('1')">test@test.com</a>
          </td>
          <td align="center">11</td>
          <td align="center">2016-04-12 &nbsp;</td>
          <td align="center">
			<button type="button" class="h18 t3 color small round red_s" onclick="location.href='input8afe.html?mode=update&amp;idx=100&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='">보기</button>
		  </td>
        </tr>
        </form>
      	  </tbody> 
      </table>

      <table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
      	<tr><td height="5"></td></tr>
        <tr>
          <td width="30%">
			  <button type="button" class="h22 t4 small icon gray" onClick="delUser('');"><span class="icon_plus"></span>회원삭제</button>
			  <button type="button" class="h22 t4 small icon gray" onClick="sendMail('');"><span class="icon_plus"></span>이메일발송</button>
			  <button type="button" class="h22 t4 small icon gray" onClick="sendSms('');"><span class="icon_plus"></span>SMS발송</button>
          </td>
          <td width="20%">    <table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td align='center'>      <table border='0' cellspacing='0' cellpadding='0'>        <tr>          <td width='22' height='50'><a href='member_listd108.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev2.gif' align='absmiddle' border=0'></a></td>          <td width='22'><a href='member_listd108.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='><img src='../image/btn_prev.gif' align='absmiddle' border=0'></a></td>          <td align='center'>&nbsp; <b>1</b> /           &nbsp; </td>          <td width='22' align='right'><a href='member_listd108.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next.gif' align='absmiddle' border='0'></a></td>          <td width='22' align='right'><a href='member_listd108.html?ptype=&amp;page=1&amp;sdate=&amp;edate=&amp;slevel=&amp;searchopt=&amp;searchkey='><img src='../image/btn_next2.gif' align='absmiddle' border='0'></a></td>        </tr>      </table>    </td></tr></table></td>
          <td width="30%"></td>
        </tr>
      </table>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>

</html>
