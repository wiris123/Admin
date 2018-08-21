<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀</title>
</head>
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

    <div id="left_area">
	<%@include file="../include/form_left.jsp"%>
	</div><!-- //left_area// -->

	<div id="Container">

<div id="location">HOME > 상담관리</div>
<div id="S_contents">
<h3>상담관리<span>작성된 상담 글을 관리 합니다.</span></h3>	

<form action="http://demohome.anywiz.co.kr/adm/manage/form/form_save.php" method="post" onSubmit="return inputCheck(this);">
<input type="hidden" name="idx" value="167">
<input type="hidden" name="code" value="">
<input type="hidden" name="page" value="1">
<input type="hidden" name="searchopt" value="">
<input type="hidden" name="searchkey" value="">
<input type="hidden" name="searchstatus" value="">
<input type="hidden" name="mode" value="update">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_basic">
  <tr>
    <th>제목</th>
    <td colspan="3"><input type="text" name="subject" value="[모바일_폼메일] 가 들어왔습니다." size="60" class="input"></td>
  </tr>
  <tr>
    <th>첨부파일</th>
    <td colspan="3">
    	<a href="down23f6.php?idx=167&amp;no=1"></a>
    	<a href="down284a.php?idx=167&amp;no=2"></a>
    	<a href="downd879.php?idx=167&amp;no=3"></a>
    </td>
  </tr>
  <tr>
    <th width="15%">이름</th>
    <td width="35%">
    	<input type="text" name="name" value="테스트" class="input">
    </td>
    <th>연락처</th>
    <td>
    	<input type="text" name="phone" value="" class="input">
    </td>
  </tr>
  <tr>
    <th>이메일</th>
    <td>
    	<input type="text" name="email" value="vg2001@naver.com" class="input">
    </td>
    <th>처리상태</th>
    <td>
      <select name="status">
      <option value="">- 선택 -</option>
    	<option value="대기중" selected>대기중</option>
    	<option value="처리중" >처리중</option>
    	<option value="처리완료" >처리완료</option>
      </select>
    </td>
  </tr>
  <tr>
    <th>작성내용</th>
    <td colspan="3">
    	<table  width='80%' border='0' cellspacing='0' cellpadding='0' class='inner_table left'><tr><th width='15%' height='20'>작성자</th><td width='85%'>테스트&nbsp;</td></tr><tr><th width='15%' height='20'>이메일</th><td width='85%'>test@test.com&nbsp;</td></tr><tr><th width='15%' height='20'>연락처</th><td width='85%'>010-0000-0000&nbsp;</td></tr><tr><th width='15%' height='20'>메모</th><td width='85%'>메모메모메모메모&nbsp;</td></tr><tr><th width='15%' height='20'>주소</th><td width='85%'>04417&nbsp;서울 용산구 다산로 8-11&nbsp;1111&nbsp;</td></tr></table>    </td>
  </tr>
  <tr>
    <th>답변내용</th>
    <td colspan="3">

<script type="text/javascript" src="../../webedit/cheditor.js"></script>
<textarea id="content" name="content"><p style="margin: 0px">test</p></textarea>
<script type="text/javascript">
var content = new cheditor();            // 에디터 개체를 생성합니다.
content.config.editorHeight = '300px';    // 에디터 세로폭입니다.
content.config.editorWidth = '100%';       	// 에디터 가로폭입니다.
content.inputForm = 'content';           				// textarea의 ID 이름입니다.
content.run();                            							// 에디터를 실행합니다.
</script>	<br /><input type="checkbox" name="smail" value="Y">&nbsp;답변 메일로 보내기 (체크시 작성자 이메일로 답변을 보냅니다.)
    </td>
  </tr>
</table>
      
<div class="center top10">
	<button type="sumbit" class="b h28 t5 color blue_big">확인</button>
	<button type="button" class="b h28 t5 color gray_big" onClick="document.location='form_list.jsp?code=&amp;searchopt=&amp;searchkey=&amp;searchstatus=&amp;page=1'">목록</button>
</div>

</form>

</div>
</div><!-- //Container// -->
</div>

<div id="Footer">Copyright ⓒ 2016 사이트명 All rights reserved.</div>
</body>
</html>