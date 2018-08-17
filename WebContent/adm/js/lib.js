
// Ŭ������ ����(�ּҺ���)
function set_ClipBoard(uri)
{

	uri = uri.replace('&lt;','<');
	uri = uri.replace('&gt;','>');
	window.clipboardData.setData('Text', uri);
	alert('����Ǿ����ϴ�.');

}


// ���ã�� �߰�
function set_BookMark(site_url, site_name)
{
	window.external.AddFavorite(site_url, site_name);
}


// ����������
function set_StartPage(site_url)
{
	//<a href="javascript:;" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.dadembi.com');">���������� ����</a>
}


// ���ݿ� ������ �ĸ��� ��´�.
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


// �̸��� üũ
function check_Email(email)
{

	var email_1 = "";
	var email_2 = "";
	var check_point = 0;

	if (email.indexOf("@") < 0 ) {
		alert("e-mail�� @ �� �����ֽ��ϴ�.");
		return false;
	}
	if (email.indexOf(".") < 0 ) {
		alert("e-mail�� . �� �����ֽ��ϴ�.");
		return false;
	}

	if (email.indexOf("'") >= 0 ) {
		alert("e-mail�� ' �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email.indexOf("|") >= 0 ) {
		alert("e-mail�� | �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email.indexOf(">") >= 0 ) {
		alert("e-mail�� > �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email.indexOf("<") >= 0 ) {
		alert("e-mail�� < �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email.indexOf(" ") >= 0 ) {
		alert("e-mail�� �����̽��� �����Ҽ� �����ϴ�..");
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
	//	alert("e-mail�� @ ���ڸ��� 3�ڸ��̻� �Է��ϼž��մϴ�.");
	//	form1.email.focus();
	//	return false;
	//}

	//if (email_2.length < 2 ) {
	//	alert("e-mail�� @ ���ڸ��� 2�ڸ��̻� �Է��ϼž��մϴ�.");
	//	form1.email.focus();
	//	return false;
	//}

	if (check_point > 1 ) {
		alert("e-mail�� @ �� 1���̻� ���� �����ϴ�.");
		return false;
	}

	if (email_2.indexOf("(") >= 0 ) {
		alert("e-mail�� ( �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf("(") >= 0 ) {
		alert("e-mail�� ( �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf(")") >= 0 ) {
		alert("e-mail�� ) �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf(",") >= 0 ) {
		alert("e-mail�� , �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf(";") >= 0 ) {
		alert("e-mail�� ; �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf(":") >= 0 ) {
		alert("e-mail�� : �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf("/") >= 0 ) {
		alert("e-mail�� / �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf("[") >= 0 ) {
		alert("e-mail�� [ �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf("]") >= 0 ) {
		alert("e-mail�� ] �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf("{") >= 0 ) {
		alert("e-mail�� { �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf("}") >= 0 ) {
		alert("e-mail�� } �� �����Ҽ� �����ϴ�..");
		return false;
	}
	if (email_2.indexOf(" ") >= 0 ) {
		alert("e-mail�� �����̽��� �����Ҽ� �����ϴ�..");
		return false;
	}

	return true;

}


// ���� üũ
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

// �ֹ� ��� ��ȣ üũ
function check_ResidentNO(str_f_num, str_l_num)
{

	var juminno = str_f_num + str_l_num;

	if(juminno=="" || juminno==null || juminno.length!=13) {
		alert("�ֹε�Ϲ�ȣ�� �����ּ���.");
		return false;
	}
	var jumin1 = juminno.substr(0,6);
	var jumin2 = juminno.substr(6,7);
	var yy         = jumin1.substr(0,2);     // �⵵
	var mm     = jumin1.substr(2,2);     // ��
	var dd     = jumin1.substr(4,2);     // ��
	var genda = jumin2.substr(0,1);     // ����
	var msg, ss, cc;

	// ���ڰ� �ƴ� ���� �Է��� ���
	if (!isNumeric(jumin1)) {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� ���ڷ� �Է��ϼ���.");
		return false;
	}
	// ���̰� 6�� �ƴ� ���
	if (jumin1.length != 6) {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
		return false;
	}
	// ù��° �ڷῡ�� ������(YYMMDD) ���� �� �⺻ ���� �˻�
	if (yy < "00" || yy > "99" ||
	mm < "01" || mm > "12" ||
	dd < "01" || dd > "31") {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
		return false;
	}
	// ���ڰ� �ƴ� ���� �Է��� ���
	if (!isNumeric(jumin2)) {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� ���ڷ� �Է��ϼ���.");
		return false;
	}
	// ���̰� 7�� �ƴ� ���
	if (jumin2.length != 7) {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
		return false;
	}
	// �����κ��� 1 ~ 4 �� �ƴ� ���
	if (genda < "1" || genda > "4") {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
		return false;
	}
	// ���� ��� - 1 �Ǵ� 2: 1900���, 3 �Ǵ� 4: 2000���
	cc = (genda == "1" || genda == "2") ? "19" : "20";
	// ù��° �ڷῡ�� ������(YYMMDD) ���� �� ��¥ ���� �˻�
	if (isYYYYMMDD(parseInt(cc+yy), parseInt(mm), parseInt(dd)) == false) {
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���.");
		return false;
	}
	// Check Digit �˻�
	if (!isSSN(jumin1, jumin2)) {
		alert("�Է��� �ֹε�Ϲ�ȣ�� ������ ��, �ٽ� �Է��ϼ���.");
		return false;
	}

	return true;

}

function isYYYYMMDD(y, m, d) {
	switch (m) {
		case 2:     // 2���� ���
			if (d > 29) return false;
			if (d == 29) {
			     // 2�� 29�� ��� ���ذ� ���������� Ȯ��
			        if ((y % 4 != 0) || (y % 100 == 0) && (y % 400 != 0))
			                return false;
			}
		break;
		case 4:     // ���� ���� ���
		case 6:
		case 9:
		case 11:
		if (d == 31) return false;
	}

	// ū ���� ���
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

// �ֹ� ��� ��ȣ üũ
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



// Ư�����ڰ��ִ��� üũ
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

// Ư������ üũ
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

// �̹��� �ѿ���
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

/* �Խ��� ��� üũ�ڽ� */

// üũ�ڽ� ��ü����
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

// üũ�ڽ� ��������
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

// üũ�ڽ����� ����
function selectReverseBbs(form){
	if(form.select_tmp.checked){
		selectAllBbs();
	}else{
		selectCancelBbs();
	}
}

// üũ�ڽ� ���ø���Ʈ
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

//���ðԽù� ����
function delBbs(purl, param){

	selbbs = selectValueBbs();

	if(selbbs == ""){
		alert("������ �Խù��� �����ϼ���.");
		return false;
	}else{
		if(confirm("������ �Խù��� ���� �����Ͻðڽ��ϱ�?")){
			document.location = purl + "?ptype=save&mode=delbbs&selbbs=" + selbbs + "&" + param;
		}
	}
}
//���ðԽù� ����
function delBbsNewBbs(purl, param){

	selbbs = selectValueBbs();
	
	if(selbbs == ""){
		alert("������ �Խù��� �����ϼ���.");
		return false;
	}else{
		if(confirm("������ �Խù��� ���� �����Ͻðڽ��ϱ�?")){
			document.location = purl + "?mode=deletebbs&selbbs=" + selbbs + "&" + param;
		}
	}
}
//�����ڸ�Ʈ ����
function delBbsNewComment(purl, param){

	selbbs = selectValueBbs();
	

	if(selbbs == ""){
		alert("������ �Խù��� �����ϼ���.");
		return false;
	}else{
		if(confirm("������ �Խù��� ���� �����Ͻðڽ��ϱ�?")){
			document.location = purl + "?mode=delbbscomment&selbbs=" + selbbs + "&" + param;
		}
	}
}
//�����ڸ�Ʈ ����
function delBbsNewComments(purl, param){

	selbbs = selectValueBbs();
	selbbs2 = selectValueCidx();

	if(selbbs == ""){
		alert("������ �Խù��� �����ϼ���.");
		return false;
	}else{
		if(confirm("������ �Խù��� ���� �����Ͻðڽ��ϱ�?")){
			document.location = purl + "?mode=deletecomments&selbbs=" + selbbs + "&selcomment=" + selbbs2 + param;
		}
	}
}

//�Խù��̵�
function moveBbs(code){
	selbbs = selectValueBbs();
	if(selbbs == ""){
		alert("�̵��� �Խù��� �����ϼ���.");
		return false;
	}else{
		var uri = "/adm/bbs/move.php?code=" + code + "&selbbs=" + selbbs;
		window.open(uri,"moveBbs","width=300,height=140");
	}
}

// �Խù�����
function copyBbs(code){
	selbbs = selectValueBbs();
	if(selbbs == ""){
		alert("������ �Խù��� �����ϼ���.");
		return false;
	}else{
		var uri = "/adm/bbs/copy.php?code=" + code + "&selbbs=" + selbbs;
		window.open(uri,"copyBbs","width=300,height=140");
	}
}

// �Խù� ��������
function orderBbs(code) {
	var uri = "/adm/bbs/order.php?code=" + code;
	window.open(uri,"orderBbs","width=650,height=400,resizable=yes,scrollbars=yes");
}

// ��ǰ ī�װ� ���̾�
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

// ���ݿ� ������ �ĸ��� ��´�.
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

//Ʈ���ͷ� ����
function snsTwitter(msg,url){
	var href = "http://twitter.com/home?status=" + encodeURIComponent(msg) + " " + encodeURIComponent(url);
	window.open(href, 'twitter', '');
}

//���̽������� ����
function snsFacebook(msg,url){
	var href = "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url) + "&t=" + encodeURIComponent(msg);
	window.open(href, 'facebook', '');
}
// ��������
function snsMe2day(msg,url,tag){
	var href = "http://me2day.net/posts/new?new_post[body]=\"" + encodeURIComponent(msg) + "\":"+encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent(tag);
  window.open(href, 'me2day', '');
}

function snsnaver(msg,url){
 var href = "http://blog.naver.com/LinkShare.nhn?url=\""+encodeURIComponent(url);
  window.open(href, 'naver', '');
}