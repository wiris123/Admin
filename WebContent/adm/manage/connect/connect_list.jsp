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
<div id="Header">
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
			<a href="../member/member_list.jsp" onFocus="this.blur();"><span>회원관리</span></a>
			<ul class="category">
				<li>
					<a href="../member/member_list.jsp">회원목록</a>
				</li>

				<li>
					<a href="../member/out_list.jsp">탈퇴회원</a>
				</li>

				<!-- <li>
					<a href="../member/mail_list.html">메일,SMS설정</a>
				</li>
				<li>
					<a href="../member/mail_test.html">메일발송테스트</a>
				</li>
				<li>
					<a href="../member/mail_send.html">단체메일발송</a>
				</li>

								<li>
					<a href="../member/sms_send.html">단체SMS발송</a>
				</li>
								<li>
					<a href="../member/member_analy.html">회원통계</a>
				</li>
				<li>
					<a href="../member/member_config.html">가입약관, 개인정보보호정책</a>
				</li> -->
											</ul>
		</li>    
		
       			<li>
			<a href="../form/form_list.html" onFocus="this.blur();"><span>폼메일관리</span></a>
        	<ul class="category">
				<li>
					<a href="../form/form_list.html">폼메일관리</a>
				</li>
				<li class="depth"><a href="#" onFocus="this.blur();">폼메일목록</a>
					<ul class="category_2depth">
												<li><a href="../form/form_listc257.html?code=formBasic">폼메일</a></li>
												<li><a href="../form/form_list4213.html?code=MformBasic">모바일_폼메일</a></li>
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
			<a href="connect_list.jsp" onFocus="this.blur();"><span>접속통계</span></a>
        	<ul class="category">
				<li>
					<a href="connect_list.jsp">접속자분석</a>
				</li>
<!-- 
				<li>
					<a href="connect_refer.html">접속경로분석</a>
				</li>

				<li>
					<a href="connect_keyword.html">검색키워드분석</a>
				</li>
				<li>
					<a href="connect_osbrowser.html">OS/브라우저</a>
				</li> -->
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
</div>

<%@include file="../include/connect_left.jsp"%>

<!-- 
<div id="Container_wrap" class="right_close">
    
    class="left_close" 좌측만 닫힘
    class="right_close" 우측만 닫힘
    class="left_close right_close" 양쪽 닫힘
   
    <div class="nav_handle_left">
		<a href="#" onFocus="this.blur();" onclick="leftBtn();"></a>
	</div>

    <div id="left_area">
		





<h2><img src="../image/header/icon3.png" alt=""> 접속자분석</h2>
<ul id="Lnb">
    <li class="on"><a href="connect_list.jsp" onFocus="this.blur();">접속자분석</a>
        <ul>
			<li class="">
				<a href="connect_list.jsp">접속자분석</a>
			</li>

			<li>
				<a href="connect_refer.html">접속경로분석</a>
			</li>

			<li>
				<a href="connect_keyword.html">검색키워드분석</a>
			</li>
			<li>
				<a href="connect_osbrowser.html">OS/브라우저</a>
			</li>
        </ul>
    </li>

</ul>





 -->

	</div><!-- //left_area// -->

	<div id="Container">
    




















<script language="javascript">
<!--
function delConnect(){

	if(confirm("접속자분석 모든 데이타가 삭제됩니다. 초기화 하시겠습니까?")){
		document.location = 'connect_savefb35.html?mode=dellist';
	}
}

function chgType(type){

	var f				= document.frm;
	var	OH_pdate		= '2018-08-08';
	var	OH_ndate		= '2018-08-08';
	var	OD_pdate		= '2018-08-01';
	var	OD_ndate		= '2018-08-31';
	var	OM_pdate		= '2018-01-01';
	var	OM_ndate		= '2018-12-31';
	var	OY_pdate		= '2013-01-01';
	var	OY_ndate		= '2023-12-31';
	var prev_date		= eval(type+'_pdate');
	var next_date		= eval(type+'_ndate');

	f.prev_date.value	= prev_date;
	f.next_date.value	= next_date;
	f.submit();
}

function chgTerm(term){

	var f				= document.frm;
	var	TO_pdate		= '2018-08-08';
	var	D7_pdate		= '2018-08-01';
	var	M1_pdate		= '2018-07-07';
	var	M3_pdate		= '2018-05-07';
	var	M6_pdate		= '2018-02-07';
	var	Y1_pdate		= '2017-08-07';
	var prev_date		= eval(term+'_pdate');
	var next_date		= '2018-08-08';

	f.prev_date.value	= prev_date;
	f.next_date.value	= next_date;
	f.submit();
}
-->
</script>

 <div id="location">HOME > 접속자분석</div>
<div id="S_contents">
<h3>접속자분석<span>접속자를 오늘/시간/일별/월별/년별 로 분석합니다.</span></h3>	

<form name="frm" action="http://demohome.anywiz.co.kr/adm/manage/connect/connect_list.php" method="get">
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="table_basic">
	<tr>
		<th width="15%">분석방법</th>
		<td width="85%">
			<input type="radio" name="analy_type" value="OH" onClick="chgType(this.value);" class="radio" checked /> 시간대별&nbsp;&nbsp;
			<input type="radio" name="analy_type" value="OD" onClick="chgType(this.value);" class="radio"  /> 일별&nbsp;&nbsp;
			<input type="radio" name="analy_type" value="OM" onClick="chgType(this.value);" class="radio"  /> 월별&nbsp;&nbsp;
			<input type="radio" name="analy_type" value="OY" onClick="chgType(this.value);" class="radio"  /> 년별
		</td>
	</tr>
	<tr>
		<th>기간</th>
		<td>
			<input class="input w100" type="text" id="datepicker1" name="prev_date" value="2018-08-08" >
			<input type="button" class="btn_calendar" id=""/> ~
			<input class="input w100" type="text" id="datepicker2" name="next_date" value="2018-08-08" >
			<input type="button" class="btn_calendar" id=""/>
			
						<button type="button" class="h22 small t3 gray_s" value="TO" onclick="chgTerm(this.value);">오늘</button>
			<button type="button" class="h22 small t3 gray_s" value="D7" onclick="chgTerm(this.value);">1주일</button>
			<button type="button" class="h22 small t3 gray_s" value="M1" onclick="chgTerm(this.value);">1개월</button>
			<button type="button" class="h22 small t3 gray_s" value="M3" onclick="chgTerm(this.value);">3개월</button>
			<button type="button" class="h22 small t3 gray_s" value="M6" onclick="chgTerm(this.value);">6개월</button>
			<button type="button" class="h22 small t3 gray_s" value="Y1" onclick="chgTerm(this.value);">1년</button>
						
			<button style="height:22px;vertical-align:bottom;" type="submit" class="b h28 t5 color blue_big">검색</button>
			<button type="button" class="h22 t4 small icon gray" onClick="delConnect();"><span class="icon_plus"></span>접속자분석 초기화</button>
		</td>
	</tr>

</table>
</form>
<br />

<script type="text/javascript" src="../../js/json2.js"></script>
<script type="text/javascript" src="../../js/swfobject.js"></script>
<script type="text/javascript">
swfobject.embedSWF("../../flashChart/open-flash-chart.swf", "my_chart11", "100%", "400", "9.0.0", "../../flashChart/expressInstall.html", {"data-file":"/adm/flashChart/chartData.php?chart_param=common|OH|2018-08-08|2018-08-08","loading":"로딩중..."},{"wmode":"transparent"});
</script>
<div id="my_chart11"></div><table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic top10">
	<tr>
		<th width="25%" height="30">총 접속자 수</th>
		<td width="25%"><font color=064F92><B>1440</b></font>명</td>
		<th width="25%">평균 접속자 수</th>
		<td width="25%"><font color=064F92><B>1.098</b></font>명</td>
	</tr>
	<tr>
		<th height="30">오늘 접속자 수</th>
		<td><font color=064F92><B>56</b></font>명</td>
		<th>어제 접속자 수</th>
		<td><font color=064F92><B>1</b></font>명</td>
	</tr>
	<tr>
		<th height="30">이번달 접속자 수</th>
		<td><font color=064F92><B>56</b></font>명</td>
		<th>이번달 평균 접속자 수</th>
		<td><font color=064F92><B>7</b></font>명</td>
	</tr>
</table>

</div>
</div><!-- //Container// -->
</div><!-- //Container_wrap// -->

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>


</body>

</html>
