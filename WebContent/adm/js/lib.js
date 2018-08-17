
// 클립보드 복사(주소복사)
function set_ClipBoard(uri)
{

	uri = uri.replace('&lt;','<');
	uri = uri.replace('&gt;','>');
	window.clipboardData.setData('Text', uri);
	alert('복사되었습니다.');

}


// 즐겨찾기 추가
function set_BookMark(site_url, site_name)
{
	window.external.AddFavorite(site_url, site_name);
}


// 시작페이지
function set_StartPage(site_url)
{
	//<a href="javascript:;" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.dadembi.com');">시작페이지 설정</a>
}


// 가격에 원단위 컴마를 찍는다.
function set_WonComma(price)
{

	if(price != null){
		var pricelen = price.length;
		var ii = pricelen%3;
		var wonprice = price.substring(0,ii);
		for(;ii<pricelen;ii+=3){
			wonprice += "," + price.substring(ii,ii+3);
		}
		if((pricelen%3) == 0)
		wonprice = wonprice.substring(1,wonprice.length);
		return wonprice;
	}

}


// 이메일 체크
function check_Email(email)
{

	var email_1 = "";
	var email_2 = "";
	var check_point = 0;

	if (email.indexOf("@") < 0 ) {
		alert("e-mail에 @ 가 빠져있습니다.");
		return false;
	}
	if (email.indexOf(".") < 0 ) {
		alert("e-mail에 . 가 빠져있습니다.");
		return false;
	}

	if (email.indexOf("'") >= 0 ) {
		alert("e-mail에 ' 는 포함할수 없습니다..");
		return false;
	}
	if (email.indexOf("|") >= 0 ) {
		alert("e-mail에 | 는 포함할수 없습니다..");
		return false;
	}
	if (email.indexOf(">") >= 0 ) {
		alert("e-mail에 > 는 포함할수 없습니다..");
		return false;
	}
	if (email.indexOf("<") >= 0 ) {
		alert("e-mail에 < 는 포함할수 없습니다..");
		return false;
	}
	if (email.indexOf(" ") >= 0 ) {
		alert("e-mail에 스페이스는 포함할수 없습니다..");
		return false;
	}

	for(var j = 0 ; j < email.length; j++)
	{
		if(email.substring(j, j + 1) != "@" && check_point == 0)
		{
			email_1 = email_1 + email.substring(j, j + 1)
		}
		else if(email.substring(j, j + 1) == "@" )
		{
			check_point = check_point + 1;
		}
		else
		{
			email_2 = email_2 + email.substring(j, j + 1);
		}
	}

	//if (email_1.length < 3 ) {
	//	alert("e-mail에 @ 앞자리는 3자리이상 입력하셔야합니다.");
	//	form1.email.focus();
	//	return false;
	//}

	//if (email_2.length < 2 ) {
	//	alert("e-mail에 @ 뒷자리는 2자리이상 입력하셔야합니다.");
	//	form1.email.focus();
	//	return false;
	//}

	if (check_point > 1 ) {
		alert("e-mail에 @ 는 1번이상 들어갈수 없습니다.");
		return false;
	}

	if (email_2.indexOf("(") >= 0 ) {
		alert("e-mail에 ( 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf("(") >= 0 ) {
		alert("e-mail에 ( 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf(")") >= 0 ) {
		alert("e-mail에 ) 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf(",") >= 0 ) {
		alert("e-mail에 , 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf(";") >= 0 ) {
		alert("e-mail에 ; 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf(":") >= 0 ) {
		alert("e-mail에 : 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf("/") >= 0 ) {
		alert("e-mail에 / 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf("[") >= 0 ) {
		alert("e-mail에 [ 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf("]") >= 0 ) {
		alert("e-mail에 ] 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf("{") >= 0 ) {
		alert("e-mail에 { 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf("}") >= 0 ) {
		alert("e-mail에 } 는 포함할수 없습니다..");
		return false;
	}
	if (email_2.indexOf(" ") >= 0 ) {
		alert("e-mail에 스페이스는 포함할수 없습니다..");
		return false;
	}

	return true;

}


// 숫자 체크
function check_Num(tocheck)
{

	if (tocheck == null || tocheck == "")
	{
		return false;
	}

	for(var j = 0 ; j < tocheck.length; j++)
	{
		if ( tocheck.substring(j, j + 1) != "0"
			&&   tocheck.substring(j, j + 1) != "1"
			&&   tocheck.substring(j, j + 1) != "2"
			&&   tocheck.substring(j, j + 1) != "3"
			&&   tocheck.substring(j, j + 1) != "4"
			&&   tocheck.substring(j, j + 1) != "5"
			&&   tocheck.substring(j, j + 1) != "6"
			&&   tocheck.substring(j, j + 1) != "7"
			&&   tocheck.substring(j, j + 1) != "8"
			&&   tocheck.substring(j, j + 1) != "9" )
		{
			return false;
		}
	}

	return true;

}

// 주민 등록 번호 체크
function check_ResidentNO(str_f_num, str_l_num)
{

	var juminno = str_f_num + str_l_num;

	if(juminno=="" || juminno==null || juminno.length!=13) {
		alert("주민등록번호를 적어주세요.");
		return false;
	}
	var jumin1 = juminno.substr(0,6);
	var jumin2 = juminno.substr(6,7);
	var yy         = jumin1.substr(0,2);     // 년도
	var mm     = jumin1.substr(2,2);     // 월
	var dd     = jumin1.substr(4,2);     // 일
	var genda = jumin2.substr(0,1);     // 성별
	var msg, ss, cc;

	// 숫자가 아닌 것을 입력한 경우
	if (!isNumeric(jumin1)) {
		alert("주민등록번호 앞자리를 숫자로 입력하세요.");
		return false;
	}
	// 길이가 6이 아닌 경우
	if (jumin1.length != 6) {
		alert("주민등록번호 앞자리를 다시 입력하세요.");
		return false;
	}
	// 첫번째 자료에서 연월일(YYMMDD) 형식 중 기본 구성 검사
	if (yy < "00" || yy > "99" ||
	mm < "01" || mm > "12" ||
	dd < "01" || dd > "31") {
		alert("주민등록번호 앞자리를 다시 입력하세요.");
		return false;
	}
	// 숫자가 아닌 것을 입력한 경우
	if (!isNumeric(jumin2)) {
		alert("주민등록번호 뒷자리를 숫자로 입력하세요.");
		return false;
	}
	// 길이가 7이 아닌 경우
	if (jumin2.length != 7) {
		alert("주민등록번호 뒷자리를 다시 입력하세요.");
		return false;
	}
	// 성별부분이 1 ~ 4 가 아닌 경우
	if (genda < "1" || genda > "4") {
		alert("주민등록번호 뒷자리를 다시 입력하세요.");
		return false;
	}
	// 연도 계산 - 1 또는 2: 1900년대, 3 또는 4: 2000년대
	cc = (genda == "1" || genda == "2") ? "19" : "20";
	// 첫번째 자료에서 연월일(YYMMDD) 형식 중 날짜 형식 검사
	if (isYYYYMMDD(parseInt(cc+yy), parseInt(mm), parseInt(dd)) == false) {
		alert("주민등록번호 앞자리를 다시 입력하세요.");
		return false;
	}
	// Check Digit 검사
	if (!isSSN(jumin1, jumin2)) {
		alert("입력한 주민등록번호를 검토한 후, 다시 입력하세요.");
		return false;
	}

	return true;

}

function isYYYYMMDD(y, m, d) {
	switch (m) {
		case 2:     // 2월의 경우
			if (d > 29) return false;
			if (d == 29) {
			     // 2월 29의 경우 당해가 윤년인지를 확인
			        if ((y % 4 != 0) || (y % 100 == 0) && (y % 400 != 0))
			                return false;
			}
		break;
		case 4:     // 작은 달의 경우
		case 6:
		case 9:
		case 11:
		if (d == 31) return false;
	}

	// 큰 달의 경우
	return true;
}
function isNumeric(s) {
	for (i=0; i<s.length; i++) {
		c = s.substr(i, 1);
		if (c < "0" || c > "9") return false;
	}
	return true;
}
function isLeapYear(y) {
	if (y < 100)
		y = y + 1900;
	if ( (y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0) ) {
		return true;
	} else {
		return false;
	}
}
function getNumberOfDate(yy, mm) {
	month = new Array(29,31,28,31,30,31,30,31,31,30,31,30,31);
	if (mm == 2 && isLeapYear(yy)) mm = 0;
	return month[mm];
}
function isSSN(s1, s2) {
	n = 2;
	sum = 0;
	for (i=0; i<s1.length; i++)
		sum += parseInt(s1.substr(i, 1)) * n++;
	for (i=0; i<s2.length-1; i++) {
		sum += parseInt(s2.substr(i, 1)) * n++;
		if (n == 10) n = 2;
	}
	c = 11 - sum % 11;
	if (c == 11) c = 1;
	if (c == 10) c = 0;
	if (c != parseInt(s2.substr(6, 1))) return false;
	else return true;
}

// 주민 등록 번호 체크
function check_ResidentNO_old(str_f_num, str_l_num)
{

	var i3=0
	for (var i=0;i<str_f_num.length;i++)
	{
		var ch1 = str_f_num.substring(i,i+1);
		if (ch1<'0' || ch1>'9') { i3=i3+1 }
	}
	if ((str_f_num == '') || ( i3 != 0 ))
	{
		return (false);
	}

	var i4=0
	for (var i=0;i<str_l_num.length;i++)
	{
		var ch1 = str_l_num.substring(i,i+1);
		if (ch1<'0' || ch1>'9') { i4=i4+1 }
	}
	if ((str_l_num == '') || ( i4 != 0 ))
	{
		return (false);
	}

	if(str_f_num.substring(0,1) < 0)
	{
		return (false);
	}

	if(str_l_num.substring(0,1) > 2)
	{
		return (false);
	}

	if((str_f_num.length > 7) || (str_l_num.length > 8))
	{
		return (false);
	}

	if ((str_f_num == '72') || ( str_l_num == '18'))
	{
		return (false);
	}

	var f1=str_f_num.substring(0,1)
	var f2=str_f_num.substring(1,2)
	var f3=str_f_num.substring(2,3)
	var f4=str_f_num.substring(3,4)
	var f5=str_f_num.substring(4,5)
	var f6=str_f_num.substring(5,6)
	var hap=f1*2+f2*3+f3*4+f4*5+f5*6+f6*7
	var l1=str_l_num.substring(0,1)
	var l2=str_l_num.substring(1,2)
	var l3=str_l_num.substring(2,3)
	var l4=str_l_num.substring(3,4)
	var l5=str_l_num.substring(4,5)
	var l6=str_l_num.substring(5,6)
	var l7=str_l_num.substring(6,7)
	hap=hap+l1*8+l2*9+l3*2+l4*3+l5*4+l6*5
	hap=hap%11
	hap=11-hap
	hap=hap%10
	if (hap != l7)
	{
		return (false);
	}

	return true;

}



// 특수문자가있는지 체크
function check_Char(id_text)
{

	var alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var numeric = '1234567890';
	var nonkorean = alpha+numeric+'_';

	var i ;
	for ( i=0; i < id_text.length; i++ )  {
		if( nonkorean.indexOf(id_text.substring(i,i+1)) < 0) {
			break ;
		}
	}

	if ( i != id_text.length ) {
		return false ;
	}
	else{
		return true ;
	}

	return true;

}

// 특수문자 체크
function check_nonChar(id_text)
{
	var nonchar = '~`!@#$%^&*()-_=+\|<>?,./;:"';
	var numeric = '1234567890';
	var nonkorean = nonchar+numeric;

	var i ;
	for ( i=0; i < id_text.length; i++ )  {
		if( nonkorean.indexOf(id_text.substring(i,i+1)) > 0) {
			break ;
		}
	}

	if ( i != id_text.length ) {
		return false ;
	}
	else{
		return true ;
	}

	return false;
}

// 이미지 롤오버
function WIZ_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function WIZ_swapImgRestore() { //v3.0
  var i,x,a=document.WIZ_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function WIZ_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.WIZ_p) d.WIZ_p=new Array();
    var i,j=d.WIZ_p.length,a=WIZ_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.WIZ_p[j]=new Image; d.WIZ_p[j++].src=a[i];}}
}

function WIZ_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=WIZ_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function WIZ_swapImage() { //v3.0
  var i,j=0,x,a=WIZ_swapImage.arguments; document.WIZ_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=WIZ_findObj(a[i]))!=null){document.WIZ_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function WIZ_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.WIZ_pgW=innerWidth; document.WIZ_pgH=innerHeight; onresize=WIZ_reloadPage; }}
  else if (innerWidth!=document.WIZ_pgW || innerHeight!=document.WIZ_pgH) location.reload();
}
WIZ_reloadPage(true);

/* 게시판 목록 체크박스 */

// 체크박스 전체선택
function selectAllBbs(){
	var i;
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].idx != null){
			if(document.forms[i].select_checkbox){
				document.forms[i].select_checkbox.checked = true;
			}
		}
	}
	return;
}

// 체크박스 선택해제
function selectCancelBbs(){
	var i;
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].select_checkbox){
			if(document.forms[i].idx != null){
				document.forms[i].select_checkbox.checked = false;
			}
		}
	}
	return;
}

// 체크박스선택 반전
function selectReverseBbs(form){
	if(form.select_tmp.checked){
		selectAllBbs();
	}else{
		selectCancelBbs();
	}
}

// 체크박스 선택리스트
function selectValueBbs(){
	var i;
	var selbbs = "";
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].idx != null){
			if(document.forms[i].select_checkbox){
				if(document.forms[i].select_checkbox.checked)
					selbbs = selbbs + document.forms[i].idx.value + "|";
				}
			}
	}
	return selbbs;
}
function selectValueCidx(){
	var i;
	var selbbs = "";
	for(i=0;i<document.forms.length;i++){
		if(document.forms[i].cidx != null){
			if(document.forms[i].select_checkbox){
				if(document.forms[i].select_checkbox.checked)
					selbbs = selbbs + document.forms[i].cidx.value + "|";
				}
			}
	}
	return selbbs;
}

//선택게시물 삭제
function delBbs(purl, param){

	selbbs = selectValueBbs();

	if(selbbs == ""){
		alert("삭제할 게시물을 선택하세요.");
		return false;
	}else{
		if(confirm("선택한 게시물을 정말 삭제하시겠습니까?")){
			document.location = purl + "?ptype=save&mode=delbbs&selbbs=" + selbbs + "&" + param;
		}
	}
}
//선택게시물 삭제
function delBbsNewBbs(purl, param){

	selbbs = selectValueBbs();
	
	if(selbbs == ""){
		alert("삭제할 게시물을 선택하세요.");
		return false;
	}else{
		if(confirm("선택한 게시물을 정말 삭제하시겠습니까?")){
			document.location = purl + "?mode=deletebbs&selbbs=" + selbbs + "&" + param;
		}
	}
}
//선택코멘트 삭제
function delBbsNewComment(purl, param){

	selbbs = selectValueBbs();
	

	if(selbbs == ""){
		alert("삭제할 게시물을 선택하세요.");
		return false;
	}else{
		if(confirm("선택한 게시물을 정말 삭제하시겠습니까?")){
			document.location = purl + "?mode=delbbscomment&selbbs=" + selbbs + "&" + param;
		}
	}
}
//선택코멘트 삭제
function delBbsNewComments(purl, param){

	selbbs = selectValueBbs();
	selbbs2 = selectValueCidx();

	if(selbbs == ""){
		alert("삭제할 게시물을 선택하세요.");
		return false;
	}else{
		if(confirm("선택한 게시물을 정말 삭제하시겠습니까?")){
			document.location = purl + "?mode=deletecomments&selbbs=" + selbbs + "&selcomment=" + selbbs2 + param;
		}
	}
}

//게시물이동
function moveBbs(code){
	selbbs = selectValueBbs();
	if(selbbs == ""){
		alert("이동할 게시물을 선택하세요.");
		return false;
	}else{
		var uri = "/adm/bbs/move.php?code=" + code + "&selbbs=" + selbbs;
		window.open(uri,"moveBbs","width=300,height=140");
	}
}

// 게시물복사
function copyBbs(code){
	selbbs = selectValueBbs();
	if(selbbs == ""){
		alert("복사할 게시물을 선택하세요.");
		return false;
	}else{
		var uri = "/adm/bbs/copy.php?code=" + code + "&selbbs=" + selbbs;
		window.open(uri,"copyBbs","width=300,height=140");
	}
}

// 게시물 순서변경
function orderBbs(code) {
	var uri = "/adm/bbs/order.php?code=" + code;
	window.open(uri,"orderBbs","width=650,height=400,resizable=yes,scrollbars=yes");
}

// 상품 카테고리 레이어
function disableLay(getno){

	if(document.all.displayer != null){
  	if(document.all.displayer.length==null) document.all.displayer.style.display='none';
  	else document.all.displayer[getno].style.display='none';
  }

}

function displayLay(getno){

	if(document.all.displayer != null){
	  for(i=0; i<document.all.displayer.length; i++){
	          document.all.displayer[i].style.display='none';
	  }
	  if(document.all.displayer.length==null) document.all.displayer.style.display='block';
	  else document.all.displayer[getno].style.display='block';
	}

}

// 가격에 원단위 컴마를 찍는다.
function won_Comma(price){
	if(price != null){
	   var pricelen = price.length;
	   var ii = pricelen%3;
	   var wonprice = price.substring(0,ii);
	   for(;ii<pricelen;ii+=3){
	      wonprice += "," + price.substring(ii,ii+3);
	   }
	   if((pricelen%3) == 0)
	   	wonprice = wonprice.substring(1,wonprice.length);
	   return wonprice;
	}
}

//트위터로 연결
function snsTwitter(msg,url){
	var href = "http://twitter.com/home?status=" + encodeURIComponent(msg) + " " + encodeURIComponent(url);
	window.open(href, 'twitter', '');
}

//페이스북으로 연결
function snsFacebook(msg,url){
	var href = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url) + "&t=" + encodeURIComponent(msg);
	window.open(href, 'facebook', '');
}
// 미투데이
function snsMe2day(msg,url,tag){
	var href = "http://me2day.net/posts/new?new_post[body]=\"" + encodeURIComponent(msg) + "\":"+encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent(tag);
  window.open(href, 'me2day', '');
}

function snsnaver(msg,url){
 var href = "http://blog.naver.com/LinkShare.nhn?url=\""+encodeURIComponent(url);
  window.open(href, 'naver', '');
}